class AddTabulatedAtToResults < ActiveRecord::Migration
  def change
    add_column :results, :tabulated_at, :datetime
  end
end
