class AddColumnsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :category_id, :integer
    add_column :pictures, :path, :string
    add_column :pictures, :likes_count, :integer
  end
end
