class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name

      t.timestamps
    end
  end
end
