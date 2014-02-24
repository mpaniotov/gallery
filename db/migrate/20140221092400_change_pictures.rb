class ChangePictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :path_file_name, :string
    remove_column :pictures, :path_content_type,:string
    remove_column :pictures, :path_file_size, :integer
    remove_column :pictures, :path_updated_at, :datetime
  end
end
