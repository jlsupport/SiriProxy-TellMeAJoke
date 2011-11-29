require 'cora'
require 'siri_objects'
require 'open-uri'
require 'nokogiri'

#############
# This is a plugin for SiriProxy that will allow you to check tonight's hockey scores
# Example usage: "Tell me a joke" or "Tell me a blonde joke"
# 
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::TellMeAJoke < SiriProxy::Plugin

	@apikey = "c11adefe5adbd439671566750f43704af03eb354b9d7e520ac"
	
  def initialize(config)
    #if you have custom configuration options, process them here!
  end
	
	# Listen
	listen_for(/tell me a joke/i) { tell_random_joke }
	listen_for(/tell me a (.*) joke/i) { |category| tell_category_joke(category) }
	
	def tell_random_joke
		#say "I don`t know any good jokes yet"
		say "A young blonde woman is distraught because she fears her husband is having an affair, so she goes to a gun shop and buys a handgun. The next day she comes home to find her husband in bed with a beautiful redhead. She grabs the gun and holds it to her own head. The husband jumps out of bed, begging and pleading with her not to shoot herself. Hysterically the blonde responds to the husband, 'Shut up...youre next!'" 
		
		request_completed #always complete your request! Otherwise the phone will "spin" at the user!
	end
	
	def tell_category_joke(temp)
		say "I don`t know any good jokes yet"
		
		request_completed #always complete your request! Otherwise the phone will "spin" at the user!
	end
	
end
