class SimplifyingBoxTable < ActiveRecord::Migration
  def up
    #remove_column :boxes, :municipality
    #remove_column :boxes, :pri
    #remove_column :boxes, :pan
    #remove_column :boxes, :prd
    #remove_column :boxes, :vem
    #remove_column :boxes, :pt
    #remove_column :boxes, :movimiento_ciudadano
    #remove_column :boxes, :nueva_alianza
    #remove_column :boxes, :nulo
    #remove_column :boxes, :otro
    #remove_index :boxes, :municipality_id
    #rename_column :boxes, :secction, :section
    add_column :boxes, :address, :string
    add_column :boxes, :references, :string
    #add_index :boxes, [:state_id, :section]
  end

  def down
  end
end