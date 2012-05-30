class DestroyMunicipalitiesTable < ActiveRecord::Migration
  def up
    drop_table :municipalities
  end

  def down
  end
end
