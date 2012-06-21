class AddIndexToBox < ActiveRecord::Migration
  def change
    add_index :boxes, [:state_id, :section]
    add_index :state, [:name]
  end
end