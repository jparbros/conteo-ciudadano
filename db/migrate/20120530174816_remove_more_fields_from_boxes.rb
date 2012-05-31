class RemoveMoreFieldsFromBoxes < ActiveRecord::Migration
  def up
    remove_column :boxes, :ticket_voting_file_name
    remove_column :boxes, :ticket_voting_content_type
    remove_column :boxes, :ticket_voting_file_size
    remove_column :boxes, :ticket_voting_updated_at
    remove_column :boxes, :municipality_id
  end

  def down
  end
end
