
# 1. Load recipes from a file X
# 2. List all recipes
# 3. Display a recipes name, description, and ingredients
require 'csv'
require 'forecast_io'

class Crimeb

	attr_reader :id, :case_number, :date, :primary_type, :description, :location_description, :arrest, :domestic, :xcoord, :ycoord, :year, :latitude, :longitude, :location
  def initialize(options={})
    @crime_id = options[:id]
		@date = options[:date]
    @case_number = options[:case_number]
    @description = options[:description]
    @primary_type = options[:primary_type]
  end

  def list
    # ForecastIO.api_key = "afcc7a0db1d5eef67ebc4e50464b1bff"
    # current_weather = ForecastIO.forecast(41.87, -87.62)
    "#{id}. #{description}, #{date}"
  end

  # def to_s
  #   <<-STRING
  # #{id} - #{name}
  # #{description}

  # Ingredients:
  # #{ingredients}

  # Preparation Instructions:
  # #{directions}
  #   STRING
  # end
end

class Visualizing
  def initialize
    @crimes = []
  end

  def load_crimes(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row_data|
      @crimes << Crimeb.new(row_data)
    end
  end

  def display_list
    # @crimes.map(&:list)

    @crimes
  end

  def find_recipe_by_id(crime_id)
      @crimes.each { |crime| return crime if crime.id == crime_id.to_s }
    raise "Can't find a crime with an id of #{crime_id.inspect}" 
  end

end

visualize = Visualizing.new
visualize.load_crimes("test.csv")

drama = visualize.display_list

p drama

drama.each do |x|
  Crime.create!(primary_type: x.primary_type)
end













