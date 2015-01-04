get '/' do
	@crimes = Crime.all	
	@homicides = Crime.where(primary_type: "HOMICIDE")
  erb :index
end
