class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :title, :string
    add_column :comments, :text, :text
    add_column :comments, :picture_id, :integer
    add_column :comments, :user_id, :integer
  end
end
