class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.integer :box_id
      t.string :checker_ip
      t.integer :user_id

      t.timestamps
    end
  end
end
