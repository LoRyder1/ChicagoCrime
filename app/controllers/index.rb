get '/' do
	@crimes = Crime.all	
  erb :index
end
