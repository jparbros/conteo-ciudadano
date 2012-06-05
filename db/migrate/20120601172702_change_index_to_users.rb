class ChangeIndexToUsers < ActiveRecord::Migration
  def up
    remove_index :users, :email
    remove_index :users, :reset_password_token
    add_index :users, :email, :unique => false
  end

  def down
  end
end