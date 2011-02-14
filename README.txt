
# 1. Create file app.ru

class HelloWorld
	def call(env)
		["200", {"Content-Type" => "text/plain"}, ["Hello World"]]
	end
end
run HelloWorld.new

# 2. run rack
rackup app.ru -p 9000

# 3. check the result in browser
http://localhost:9000/


# by default create all rack related code in config.ru file and then you can start rackup without file parameter

# Rack can be used to create middleware e.g. MyFilter.ru 
# to verify start rack in cmd type:
# rackup .\myFilter.ru -p 9000
# and visit:
# http://localhost:9000/myAppFilter
# http://localhost:9000/yourAppFilter
