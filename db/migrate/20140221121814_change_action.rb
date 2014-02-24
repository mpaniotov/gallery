class ChangeAction < ActiveRecord::Migration
  def change
    remove_column :actions, :login_time, :datetime
    remove_column :actions, :logout_time, :datetime
    remove_column :actions, :got_liked, :boolean
    remove_column :actions, :comment_id, :integer

    add_column :actions, :action_type, :string

  end
end
