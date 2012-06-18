class AddLocationsToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :latitude, :float
    add_column :boxes, :longitude, :float
    add_column :boxes, :gmaps, :boolean
  end
end
