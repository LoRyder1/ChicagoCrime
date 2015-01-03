require 'csv'
require 'forecast_io'

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