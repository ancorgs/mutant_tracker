#
# ActiveRecord model to represent the tasks assigned to teams
#
class Task < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  ##
  # belongs_to association with the Team model
  belongs_to :team

  ##
  # Association with the ActiveHash model TaskState
  belongs_to_active_hash :state, :class_name => "TaskState", :shortcuts => [:name]

  validates :title, :state_id, presence: true
end
