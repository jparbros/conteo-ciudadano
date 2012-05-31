class CreateResultImages < ActiveRecord::Migration
  def change
    create_table :result_images do |t|
      t.string :image
      t.references :box

      t.timestamps
    end
  end
end
