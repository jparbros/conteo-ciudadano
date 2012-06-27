class AddExifFieldToResultImages < ActiveRecord::Migration
  def change
    add_column :result_images, :exif, :text
  end
end
