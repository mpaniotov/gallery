class Addcol < ActiveRecord::Migration
  def change
    add_column :pictures, :name, :string
  end
end
