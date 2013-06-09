class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    add_column :notes, :category_id, :integer
  end
end
