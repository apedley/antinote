class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.boolean :setup_complete
      t.string :api_key

      t.timestamps
    end
  end
end
