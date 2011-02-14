require "./myFramework"
require "./haiku"
require "./quotes"

class HaikuApp < MyFramework
	def initialize
		get("index", :poem => Haiku.new.random)
	end
end

class QuotesApp < MyFramework
	def initialize
		get("index", :poem => Quotes.new.random)
	end
end

run HaikuApp.new