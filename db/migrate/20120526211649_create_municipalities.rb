class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.integer :number
      t.references :state
      t.string :name

      t.timestamps
    end
    add_index :municipalities, :state_id
  end
end