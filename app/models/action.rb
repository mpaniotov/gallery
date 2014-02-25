class Action < ActiveRecord::Base
  belongs_to :user

  serialize :data
end
