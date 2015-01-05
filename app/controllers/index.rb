get '/' do
	@crimes = Crime.all	
	@homicides = Crime.where(primary_type: "HOMICIDE").order("RANDOM()").limit(5)

	forecasting = Client.new
	forecastAPIkey = "afcc7a0db1d5eef67ebc4e50464b1bff"
	latitude = 41.87
	longitude = -87.62

	@temp =[]

	@homicides.each do |crime|

		time = parse_time(crime.date)
		@api_call = JSON.parse(forecasting.get("https://api.forecast.io/forecast/"+forecastAPIkey+"/"+latitude.to_s+","+longitude.to_s+","+(time)).body)


		temp = @api_call["currently"]["temperature"]

		specific_crime = Crime.find(crime.id)

		crime.update_attributes(temp: temp)



	end
	




  erb :index
end




