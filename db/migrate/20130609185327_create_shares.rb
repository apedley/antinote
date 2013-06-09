class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :note_id
      t.string :uuid
      t.timestamps
    end
  end
end
