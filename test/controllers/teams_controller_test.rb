require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  before do
    @team = create(:team)
  end

  describe 'TeamsController' do
    it "should get index" do
      get :index
      assert_response :success
      assigns(:teams).wont_be_nil
    end
    
    it "should get new" do
      get :new
      assert_response :success
    end

    it "should prevent teams duplication" do
      assert_no_difference('Team.count') do
        post :create, team: { name: @team.name }
      end
    end

    it "should create team" do
      assert_difference('Team.count') do
        post :create, team: { name: 'The A-Team'}
      end

      assert_redirected_to teams_path
    end

    it "should get edit" do
      get :edit, id: @team
      assert_response :success
    end

    it "should update team" do
      mutant = create(:mutant)
      @team.mutants.must_be :empty?
      patch :update, id: @team, team: { name: 'Unmistery men', mutant_ids: [mutant.id] }
      assert_redirected_to teams_path
      @team.reload.name.must_equal 'Unmistery men'
      @team.mutants.must_include mutant
    end

    it "should prevent removing a team's name" do
      name = @team.name
      patch :update, id: @team, team: { name: '' }
      assert_response :success # Not redirect
      @team.reload.name.must_equal name
    end


    it "should destroy team" do
      assert_difference('Team.count', -1) do
        delete :destroy, id: @team
      end

      assert_redirected_to teams_path
    end
  end
end
