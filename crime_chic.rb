
# 1. Load recipes from a file X
# 2. List all recipes
# 3. Display a recipes name, description, and ingredients
require 'csv'

class Crime

	attr_reader :id, :case_number, :date, :primary_type, :description, :location_description, :arrest, :domestic, :xcoord, :ycoord, :year, :latitude, :longitude, :location
  def initialize(options={})
		@id = options[:id]
    @case_number = options[:case_number]
    @description = options[:description]
    @primary_type = options[:primary_type]
  end

  def list
    "#{id}. #{name}"
  end

  def to_s
    <<-STRING
  #{id} - #{name}
  #{description}

  Ingredients:
  #{ingredients}

  Preparation Instructions:
  #{directions}
    STRING

  
  end
end

class Visualizing
  def initialize
    @crimes = []
  end

  def load_crimes(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row_data|
      @crimes << Crime.new(row_data)
    end
  end

  def display_list
    @crimes.map(&:list)
  end

  def find_recipe_by_id(crime_id)
      @crimes.each { |crime| return crime if crime.id == crime_id.to_s }
    raise "Can't find a crime with an id of #{crime_id.inspect}" 
  end

end


# if ARGV.any?
#   COMMAND = ARGV[0]
#   ARGUMENT = ARGV[1]


#   bistro = Bistro.new
#   bistro.load_recipes("recipes.csv")

#   if COMMAND == "list"
#     puts bistro.display_list
#   elsif COMMAND == "display"
#     puts bistro.find_recipe_by_id(ARGUMENT)
#   end
# end




