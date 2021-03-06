
require 'uri'
require 'net/http'
require 'net/https'
require 'json'

helpers do 
	
# Parsing the CSV date and time, and converting it to an acceptable format for the Forecast IO API call

	def parse_time(crimedate)
		date = crimedate.split(" ")[0]
		x = date.gsub("/", " ").split(" ")
		format = x[2] + "-" + x[0] + "-" + x[1] + "T12:00:00"
		format
	end

# Making the HTTP request for the Forecast IO API call... this is very much a longhand approach - could've used the Forecast IO Gem and simplified some of this
# Not toally necessary considering the logic is included in the seed file

	class Client
		def get(url)
	    # create the HTTP GET request
	    uri = URI.parse(url)
	    http = Net::HTTP.new(uri.host, uri.port)
	    http.use_ssl = true
	    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	    request = Net::HTTP::Get.new(URI(url))

	    # connect to the server and send the request
	    response = http.request(request)
	    response.body

	    response
	  end
	end
end


