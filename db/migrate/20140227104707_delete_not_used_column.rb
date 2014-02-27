class DeleteNotUsedColumn < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :comments, :title, :string
  end
end
