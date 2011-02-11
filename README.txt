
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

