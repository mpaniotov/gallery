class AddDataField < ActiveRecord::Migration
  def change
    remove_column :actions, :navigation, :string
    add_column :actions, :data, :text
  end
end
