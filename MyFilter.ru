class MyFilter

	def initialize(app)
		@app = app
	end
	
	def call(env)
		status, headers, @response = @app.call(env)
		[status, headers, self]
	end
	
	def each(&block)
		block.call("<p>Hello from <b>my</b> filter on #{Time.new}</p>")
		@response.each(&block)
	end
	
end

class YourFilter

	def initialize(app)
		@app = app
	end
	
	def call(env)
		status, headers, @response = @app.call(env)
		[status, headers, self]
	end
	
	def each(&block)
		block.call("<p>Hello from <b>your</b> filter on #{Time.new}</p>")
		@response.each(&block)
	end
	
end

class MyApp

	def call(env)
		["200", {"Content-Type" => "text/html"}, ["My app works!!!"]]
	end

end


map '/' do 
  use MyFilter
  run MyApp.new
end
map '/myAppFilter' do 
  use MyFilter
  run MyApp.new
end

map '/yourAppFilter' do 
  use YourFilter
  run MyApp.new
end

# to verify start rack in cmd type:
# rackup .\myFilter.ru -p 9000
# and visit:
# http://localhost:9000/myAppFilter
# http://localhost:9000/yourAppFilter


