class CreateExitPolls < ActiveRecord::Migration
  def change
    create_table :exit_polls do |t|
      t.boolean :jvm
      t.boolean :epn
      t.boolean :amlo
      t.boolean :gqt
      t.boolean :null
      t.boolean :other

      t.timestamps
    end
  end
end
