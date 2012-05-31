class AddFieldsToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :district_head, :string
    add_column :boxes, :nominal_list, :integer
    add_column :boxes, :kind, :string
  end
end
