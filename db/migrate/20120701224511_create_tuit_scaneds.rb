class CreateTuitScaneds < ActiveRecord::Migration
  def change
    create_table :tuit_scaneds do |t|
      t.string :twitter_id
      t.boolean :created

      t.timestamps
    end
  end
end
