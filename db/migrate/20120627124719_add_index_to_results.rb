class AddIndexToResults < ActiveRecord::Migration
  def change
    add_index :results, [:state, :box_id]
  end
end