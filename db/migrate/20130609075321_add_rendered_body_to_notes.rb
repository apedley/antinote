class AddRenderedBodyToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :rendered_body, :text
  end
end
