require 'test_helper'

class ManageMutantsTest < ActionDispatch::IntegrationTest

  describe "manage mutants" do

    before do
      create(:team)
      create(:team, name: 'Unmistery men')
    end

    it "should be able to create a new mutant" do
      visit mutants_path
      click_link 'New mutant'
      fill_in :name, with: 'Invisible boy'
      fill_in :superpowers, with: 'Invisibility (only when nobody is looking)'
      select 'Mistery men', from: :teams
      select 'Unmistery men', from: :teams
      click_button 'Create mutant'
      page.must_have_content("successfully created.")

      @boy = Mutant.find_by name: 'Invisible boy'
      find("#mutants #mutant-#{@boy.id} .teams").must_have_content "Mistery men, Unmistery men"
    end
  end
end


