class AddVoteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vote, :boolean
  end
end
