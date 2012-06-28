class AddAdminIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :admin_id, :integer
  end
end
