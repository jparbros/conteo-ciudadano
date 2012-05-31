class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :pan, default: 0
      t.integer :pri, default: 0
      t.integer :prd, default: 0
      t.integer :pvem, default: 0
      t.integer :pt, default: 0
      t.integer :movimiento_ciudadano, default: 0
      t.integer :nueva_alianza, default: 0
      t.integer :null, default: 0
      t.integer :others, default: 0
      t.string :state
      t.references :box

      t.timestamps
    end
  end
end
