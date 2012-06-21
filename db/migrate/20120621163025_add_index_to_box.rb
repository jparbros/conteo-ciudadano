class AddIndexToBox < ActiveRecord::Migration
  def change
    add_index :state, [:name]
  end
end