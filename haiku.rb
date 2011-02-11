class Haiku
  def initialize
    @poems = [
	  "Ancient pond 
	   Frog leaps 
	   Splash!",

	  "Waterjar cracks - 
       I lie awake 
	   This icy night.",
      
	  "Lightening - 
       Heron's cry 
       Stabs the darkness",
    ] 
  end
  def random
    @poems[rand(@poems.size)].gsub("\n", "<br/>")
  end
end