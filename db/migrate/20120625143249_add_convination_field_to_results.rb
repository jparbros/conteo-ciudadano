class AddConvinationFieldToResults < ActiveRecord::Migration
  def change
    add_column :results, :pri_pvem, :integer
    add_column :results, :prd_pt_mc, :integer
    add_column :results, :prd_pt, :integer
    add_column :results, :prd_mc, :integer
    add_column :results, :pt_mc, :integer
  end
end
