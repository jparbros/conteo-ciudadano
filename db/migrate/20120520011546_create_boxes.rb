class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.references :state
      #t.references :municipality
      t.integer :number
      t.integer :district
      t.integer :section
      t.string :location
      #t.integer :pri
      #t.integer :pan
      #t.integer :prd
      #t.integer :vem
      #t.integer :pt
      #t.integer :movimiento_ciudadano
      #t.integer :nueva_alianza
      #t.integer :nulo
      #t.integer :otro
      
      t.boolean :active

      t.timestamps
    end
    add_index :boxes, :state_id
    add_index :boxes, :section
    #add_index :boxes, :municipality_id
  end
end
