
require 'csv'
require 'forecast_io'

class OneCrime
	attr_reader :date, :primary_type, :description, :location_description, :latitude, :longitude, :community_area, :district, :block
  def initialize(options={})
		@date = options[:date]
    @primary_type = options[:primary_type]
    @description = options[:description]
    @location_description = options[:location_description]
    @latitude = options[:latitude]
    @longitude = options[:longitude]
    @community_area = options[:community_area]
    @district = options[:district]
    @block = options[:block]
  end
end

class Parse
  attr_reader :crimes
  def initialize
    @crimes = []
  end

  def load_crimes(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row_data|
      @crimes << OneCrime.new(row_data)
    end
  end
end

parse = Parse.new

# parse.load_crimes("db/test.csv")
parse.load_crimes("Crimes_-_2013.csv")

parsed_crimes = parse.crimes

p parsed_crimes

parsed_crimes.each do |wrongdoing|
  Crime.create!(date: wrongdoing.date, primary_type: wrongdoing.primary_type, description: wrongdoing.description, location_description: wrongdoing.location_description, latitude: wrongdoing.latitude, longitude: wrongdoing.longitude, community_area: wrongdoing.community_area, district: wrongdoing.district, block: wrongdoing.block)
end


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




  @crimes = Crime.all 
  @homicides = Crime.where(primary_type: "HOMICIDE")

  forecasting = Client.new
  forecastAPIkey = "521aad1331e6f66d7bf1ed4ec06b9aa3"
  latitude = 41.87
  longitude = -87.62

  def parse_time(crimedate)
    date = crimedate.split(" ")[0]
    x = date.gsub("/", " ").split(" ")
    format = x[2] + "-" + x[0] + "-" + x[1] + "T12:00:00"
    format
  end




  @homicides.each do |crime|

    time = parse_time(crime.date)
    @api_call = JSON.parse(forecasting.get("https://api.forecast.io/forecast/"+forecastAPIkey+"/"+latitude.to_s+","+longitude.to_s+","+(time)).body)


    temp = @api_call["currently"]["temperature"]

    specific_crime = Crime.find(crime.id)

    crime.update_attributes(temp: temp)
  end










