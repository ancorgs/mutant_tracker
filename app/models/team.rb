#
# ActiveRecord model to represent teams formed by several mutants
#
class Team < ActiveRecord::Base

  ##
  # HABTM association with the Mutant model
  has_and_belongs_to_many :mutants

  validates :name, presence: true, uniqueness: true
end
