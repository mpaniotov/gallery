class AddColumnsToActions < ActiveRecord::Migration
  def change
    add_column :actions, :user_id, :integer
    add_column :actions, :navigation, :string
    add_column :actions, :login_time, :datetime
    add_column :actions, :logout_time, :datetime
    add_column :actions, :got_liked, :boolean
    add_column :actions, :comment_id, :integer
  end
end
