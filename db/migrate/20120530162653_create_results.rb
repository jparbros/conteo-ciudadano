class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :pan
      t.integer :pri
      t.integer :prd
      t.integer :pvem
      t.integer :pt
      t.integer :movimiento_ciudadano
      t.integer :nueva_alianza
      t.integer :null
      t.integer :others
      t.integer :state
      t.references :box

      t.timestamps
    end
  end
end
