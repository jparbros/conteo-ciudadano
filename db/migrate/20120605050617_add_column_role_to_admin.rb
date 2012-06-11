class AddColumnRoleToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :role, :string
  end
end
