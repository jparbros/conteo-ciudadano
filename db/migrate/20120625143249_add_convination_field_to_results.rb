class AddConvinationFieldToResults < ActiveRecord::Migration
  def change
    add_column :results, :pri_pvem, :integer, default: 0
    add_column :results, :prd_pt_mc, :integer, default: 0
    add_column :results, :prd_pt, :integer, default: 0
    add_column :results, :prd_mc, :integer, default: 0
    add_column :results, :pt_mc, :integer, default: 0
  end
end
