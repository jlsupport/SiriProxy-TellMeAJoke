require 'cora'
require 'siri_objects'
require 'open-uri'
require 'nokogiri'

#############
# This is a plugin for SiriProxy to get siri telling you jokes from jokeit.net
#
# Example usage: "Tell me a joke" or "Tell me a blonde joke"
# 
# Request a apikey at support@jokeit.net
#
#############

class SiriProxy::Plugin::TellMeAJoke < SiriProxy::Plugin

	@apikey = "c11adefe5adbd439671566750f43704af03eb354b9d7e520ac"
	
  def initialize(config)
    #if you have custom configuration options, process them here!
  end
	
	# Listen
	listen_for(/tell me a joke/i) { tell_random_joke }
	listen_for(/tell me a (.*) joke/i) { |category| tell_category_joke(category) }
	
	def tell_random_joke
		if(@apikey == "")
			say "Invalid api key"
		else
			doc = Nokogiri::XML(open("http://www.jokeit.net/api/siriproxy/getjoke.php"))
			root = doc.xpath('//root').map do |i|
			status = i.xpath('status')
			
			say "Status is: " + status
		
		request_completed #always complete your request! Otherwise the phone will "spin" at the user!
	end
	
	def tell_category_joke(category)
		say "I don`t know any good jokes yet"
		
		request_completed #always complete your request! Otherwise the phone will "spin" at the user!
	end
	
end
