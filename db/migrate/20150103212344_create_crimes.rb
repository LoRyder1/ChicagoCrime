class CreateCrimes < ActiveRecord::Migration
  def change
  	create_table :crimes do |t|
  		t.integer :crime_id
  		t.integer :case_number
  		t.date :date
  		t.string :primary_type
  		t.string :description
  		t.string :location_description
  		t.string :arrest
  		t.string :domestic
  		t.float :xcoord
  		t.float :ycoord
  		t.integer :year
  		t.float :latitude
  		t.float :longitude
  		t.string :location

  		t.timestamps
  	end
  end
end
