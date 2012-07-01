class CreateExternalUrls < ActiveRecord::Migration
  def change
    create_table :external_urls do |t|
      t.integer :box_id
      t.string :url

      t.timestamps
    end
  end
end
