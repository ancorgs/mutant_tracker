require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  describe 'Team' do
    it "has a valid factory" do
      create(:team).must_be :valid?
    end

    it "is invalid withour name" do
      unnamed = build(:team, name: '')
      unnamed.wont_be :valid?
      unnamed.errors.messages[:name].must_include "can't be blank"
    end

    it "does not allow duplicated names" do
      create(:team)
      more_mistery_men = build(:team)
      more_mistery_men.wont_be :valid?
      more_mistery_men.errors.messages[:name].must_include 'has already been taken'
    end
  end
end
