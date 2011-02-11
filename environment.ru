
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

run EnvironmentOutput.new