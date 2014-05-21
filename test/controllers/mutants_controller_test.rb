require 'test_helper'
#require 'mutants_controller' # Required to prevent a simplecov + MiniTest:Spec issue

class MutantsControllerTest < ActionController::TestCase
  before do
    @mutant = create(:mutant)
  end

  describe 'MutantsController' do
    it "should get index" do
      get :index
      assert_response :success
      assigns(:mutants).wont_be_nil
    end
    
    it "should get new" do
      get :new
      assert_response :success
    end

    it "should prevent mutants duplication" do
      assert_no_difference('Mutant.count') do
        post :create, mutant: { name: @mutant.name, superpowers: @mutant.superpowers }
      end
    end

    it "should create mutant" do
      assert_difference('Mutant.count') do
        post :create, mutant: { name: 'Shoveler'}
      end

      assert_redirected_to mutants_path
    end

    it "should get edit" do
      get :edit, id: @mutant
      assert_response :success
    end

    it "should update mutant" do
      team = create(:team)
      @mutant.teams.must_be :empty?
      patch :update, id: @mutant, mutant: { name: 'Blue Rajah', superpowers: 'Fork Flinging', team_ids: [team.id] }
      assert_redirected_to mutants_path
      @mutant.reload.name.must_equal 'Blue Rajah'
      @mutant.teams.must_include team
    end

    it "should prevent removing a mutant's name" do
      name = @mutant.name
      patch :update, id: @mutant, mutant: { name: '' }
      assert_response :success # Not redirect
      @mutant.reload.name.must_equal name
    end


    it "should destroy mutant" do
      assert_difference('Mutant.count', -1) do
        delete :destroy, id: @mutant
      end

      assert_redirected_to mutants_path
    end
  end
end
