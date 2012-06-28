class CreateHistoricalResults < ActiveRecord::Migration
  def change
    create_table :historical_results do |t|
      t.integer :jvm
      t.integer :epn
      t.integer :amlo
      t.integer :quadri
      t.integer :nulls
      t.integer :others
      t.integer :totals

      t.timestamps
    end
  end
end
