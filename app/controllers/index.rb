get '/' do

	bistro = Visualizing.new
  bistro.load_crimes("test.csv")


	drama = Crime.new
	@loadcsv = drama.load_crimes("test.csv")

	raise @loadcsv
	@crimes = drama.list



  erb :index
end
