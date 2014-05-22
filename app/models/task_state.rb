#
# ActiveHash containing the possible task statuses
#
class TaskState < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { :id => 1, :order => 1, :name => 'new' },
    { :id => 2, :order => 2, :name => 'progress' },
    { :id => 3, :order => 3, :name => 'canceled' },
    { :id => 4, :order => 4, :name => 'done' }
  ]

  enum_accessor :name

  # Human readable label
  def title
    I18n.t(name, :scope => "activehash.task_status")
  end
end

