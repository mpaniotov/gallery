class UpdLikesCount < ActiveRecord::Migration
  def change
      change_column :pictures, :likes_count, :integer, :default=>0
  end
end
