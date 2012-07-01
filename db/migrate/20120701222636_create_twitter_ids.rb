class CreateTwitterIds < ActiveRecord::Migration
  def change
    create_table :twitter_ids do |t|
      t.string :last_twitter_id

      t.timestamps
    end
  end
end
