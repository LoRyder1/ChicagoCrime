get '/' do
	# @crimes = Crime.all	
	# @homicides = Crime.where(primary_type: "HOMICIDE")

	# forecasting = Client.new
	# forecastAPIkey = "afcc7a0db1d5eef67ebc4e50464b1bff"
	# latitude = 41.87
	# longitude = -87.62

	# @temp =[]

	# @homicides.each do |crime|

	# 	time = parse_time(crime.date)
	# 	@api_call = JSON.parse(forecasting.get("https://api.forecast.io/forecast/"+forecastAPIkey+"/"+latitude.to_s+","+longitude.to_s+","+(time)).body)


	# 	temp = @api_call["currently"]["temperature"]

	# 	specific_crime = Crime.find(crime.id)

	# 	crime.update_attributes(temp: temp)
	# end

	@homicides = Crime.where(primary_type: "HOMICIDE")

	twenty = []

	@homicides.each do |homicide|
		if homicide.temp > 0 && homicide.temp < 21
			twenty << homicide
		end
	end

	@twenty = twenty.count

	forty = []

	@homicides.each do |homicide|
		if homicide.temp > 20 && homicide.temp < 41
			forty << homicide
		end
	end

	@forty = forty.count

	sixty = []

	@homicides.each do |homicide|
		if homicide.temp > 40 && homicide.temp < 61
			sixty << homicide
		end
	end

	@sixty = sixty.count

	seventy = []

	@homicides.each do |homicide|
		if homicide.temp > 60 && homicide.temp < 71
			seventy << homicide
		end
	end

	@seventy = seventy.count

	eighty = []

	@homicides.each do |homicide|
		if homicide.temp > 70 && homicide.temp < 81
			eighty << homicide
		end
	end

	@eighty = eighty.count

	high = []

	@homicides.each do |homicide|
		if homicide.temp > 80
			high << homicide
		end
	end

	@high = high.count


	@hom2 = [
		{temperature: "0-20", homicides: @twenty},
		{temperature: "21-40", homicides: @forty},
		{temperature: "41-60", homicides: @sixty},
		{temperature: "61-70", homicides: @seventy},
		{temperature: "71-80", homicides: @eighty},
		{temperature: "81+", homicides: @high}
	]
	

	# @drama = [
	# 	{date: "jan 12", temperature: 50}, 
	# 	{date: "feb 12", temperature: 80}, 
	# 	{date: "june 12", temperature: 90}, 
	# 	{date: "aug 12", temperature: 40}, 
	# 	{date: "sept 12", temperature: 25} 
	# ]

	# @district_homicides = {district: , homicide_total: }

	@hom1 = Crime.where(primary_type: "HOMICIDE")

	@d_homicides = []
	@hom1.each do |homicides|
		@d_homicides << homicides.district
	end

	@uniq = @d_homicides.uniq

  erb :index
end

			
			# @history = [
			# 	{date: Time.at(@year07time).strftime("%B, %Y"), temperature: @year07temp.to_i},
			# 	{date: Time.at(@year00time).strftime("%B, %Y"), temperature: @year00temp.to_i},
			# 	{date: Time.at(@year93time).strftime("%B, %Y"), temperature: @year93temp.to_i},
			# 	{date: Time.at(@year86time).strftime("%B, %Y"), temperature: @year86temp.to_i},
			# 	{date: Time.at(@year79time).strftime("%B, %Y"), temperature: @year79temp.to_i},
			# 	{date: Time.at(@year72time).strftime("%B, %Y"), temperature: @year72temp.to_i}
			# ]



