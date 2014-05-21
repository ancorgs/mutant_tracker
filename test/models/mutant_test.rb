require 'test_helper'
#require 'mutant' # Required to prevent a simplecov + MiniTest:Spec issue

class MutantTest < ActiveSupport::TestCase
  describe 'Mutant' do
    it "has a valid factory" do
      create(:mutant).must_be :valid?
    end

    it "is invalid withour name" do
      unnamed = build(:mutant, name: '')
      unnamed.wont_be :valid?
      unnamed.errors.messages[:name].must_include "can't be blank"
    end

    it "does not allow duplicated names" do
      create(:mutant)
      second_mr_fury = build(:mutant)
      second_mr_fury.wont_be :valid?
      second_mr_fury.errors.messages[:name].must_include 'has already been taken'
    end
  end
end
