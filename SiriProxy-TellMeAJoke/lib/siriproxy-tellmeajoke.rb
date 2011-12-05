require 'cora'
require 'siri_objects'
require 'open-uri'
require 'nokogiri'

#############
# This is a plugin for SiriProxy to get siri telling you jokes from jokeit.net
#
# Example usage: "Tell me a joke"
# 
# Request a apikey at support@jokeit.net
#
#############

class SiriProxy::Plugin::TellMeAJoke < SiriProxy::Plugin
	
	@@apikey = ""
	
  def initialize(config)
  end
	
	# Listen
	listen_for(/tell me a joke/i) { tell_random_joke }
	
	def tell_random_joke
		if(@@apikey == "")
			say "Invalid API key"
		else
			doc = Nokogiri::XML(open("http://www.jokeit.net/api/siriproxy/getjoke.php?apikey=#{@@apikey}"))
			root = doc.xpath('//root').map do |i|
			@status = i.xpath('status').first.text()
			end
			
			if(@status == "OK")
				root = doc.xpath('//root').map do |i|
				@joke = i.xpath('joke').first.text()
				end
				say "" + @joke
			else
				say "" + @status
			end

		end
		request_completed #always complete your request! Otherwise the phone will "spin" at the user!
	end
	
end
