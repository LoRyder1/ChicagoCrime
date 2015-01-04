
require 'csv'
require 'forecast_io'

class Analyze
	attr_reader :date, :primary_type, :description, :location_description, :latitude, :longitude, :community_area, :district
  def initialize(options={})
		@date = options[:date]
    @primary_type = options[:primary_type]
    @description = options[:description]
    @location_description = options[:location_description]
    @latitude = options[:latitude]
    @longitude = options[:longitude]
    @community_area = options[:community_area]
    @district = options[:district]
  end
end

class Parsing
  attr_reader :crimes
  def initialize
    @crimes = []
  end

  def load_crimes(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row_data|
      @crimes << Analyze.new(row_data)
    end
  end
end

parse = Parsing.new
parse.load_crimes("db/test.csv")

drama = parse.crimes

# p drama

drama.each do |spectacle|
  Crime.create!(date: spectacle.date, primary_type: spectacle.primary_type, description: spectacle.description, location_description: spectacle.location_description, latitude: spectacle.latitude, longitude: spectacle.longitude, community_area: spectacle.community_area, district: spectacle.district)
end













