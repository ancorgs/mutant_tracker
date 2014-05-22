require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  describe 'Task' do
    it "has a valid factory" do
      create(:task).must_be :valid?
    end

    it "is invalid without title" do
      unnamed = build(:task, title: '')
      unnamed.wont_be :valid?
      unnamed.errors.messages[:title].must_include "can't be blank"
    end

    it "is invalid without state" do
      unnamed = build(:task, state_id: nil)
      unnamed.wont_be :valid?
      unnamed.errors.messages[:state_id].must_include "can't be blank"
    end
  end
end
