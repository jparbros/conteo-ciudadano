class AddBlanketToResultImages < ActiveRecord::Migration
  def change
    add_column :result_images, :blanket, :string
  end
end
