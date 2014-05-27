require 'test_helper'

class ManageTasksTest < ActionDispatch::IntegrationTest

  describe "manage tasks" do

    before do
      @mistery = create(:team)
      create(:task, team: @mistery)
      create(:task, team: @mistery, state_name: 'canceled')
      create(:task, team: create(:team, name: 'The A Team'))
      create(:task, state_name: 'canceled')
    end

    it "should filter by team and state" do
      # Visit the list. There should be 4 tasks
      visit tasks_path
      page.all('#tasks tbody tr').count.must_equal 4

      # Filter by state == canceled
      select 'canceled', from: :state
      click_button 'Filter'
      within('#tasks tbody') do
        page.all('tr').count.must_equal 2
        page.all('td.state').map(&:text).must_equal ['canceled']*2
        page.all('td.team').map(&:text).sort.must_equal ['', @mistery.name]
      end

      # Without removing the previous filter, filter by team
      select @mistery.name, from: :asignee
      click_button 'Filter'
      page.all('#tasks tbody tr').count.must_equal 1

      # Remove the filter by state
      select '', from: :state
      click_button 'Filter'
      within('#tasks tbody') do
        page.all('tr').count.must_equal 2
        page.all('td.state').map(&:text).sort.must_equal %w(canceled new)
        page.all('td.team').map(&:text).sort.must_equal [@mistery.name]*2
      end

      # And, finally, reset the filters
      click_link 'All'
      page.all('#tasks tbody tr').count.must_equal 4
    end
  end
end


