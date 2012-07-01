class AddVariantsToStates < ActiveRecord::Migration
  def change
    add_column :states, :variants, :text
  end
end
