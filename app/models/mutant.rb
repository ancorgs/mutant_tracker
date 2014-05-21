#
# ActiveRecord model to represent the different mutants
#
class Mutant < ActiveRecord::Base

  ##
  # HABTM association with the Team model
  has_and_belongs_to_many :teams

  validates :name, presence: true, uniqueness: true
end
