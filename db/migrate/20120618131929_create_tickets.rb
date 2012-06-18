class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :ticketable_id
      t.string :ticketable_type
      t.string :issue
      t.string :state

      t.timestamps
    end
  end
end
