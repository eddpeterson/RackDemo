
class EnvironmentOutput
	def initialize(app = nil)
		@app = app
	end
	def call(env)
	    out = []
		
		unless(@app.nil?)
			response = @app.call(env)[2]
			out << response
		end
		
		env.keys.each {|key| out << "<li>#{key}=#{env[key]}"}
		["200", {"Content-Type" => "text/html"}, out]
	end

end

require "./haiku"
require "haml"
class MyApp
	def call(env)
		poem = Haiku.new.random
		template = File.open("views/index.haml").read
		engine = Haml::Engine.new(template)
		out = engine.render(Object.new, :poem => poem)
		["200", {"Content-Type" => "text/html"}, out]
	end
end

use EnvironmentOutput
run MyApp.new