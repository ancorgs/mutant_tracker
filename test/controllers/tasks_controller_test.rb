require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  before do
    @task = create(:task)
  end

  describe 'TasksController' do
    it "should get index" do
      get :index
      assert_response :success
      assigns(:tasks).wont_be_nil
    end
    
    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create task" do
      assert_difference('Task.count') do
        post :create, task: { title: 'Recruit Invisible Boy', state_id: TaskState::NEW.id }
      end

      assert_redirected_to tasks_path
    end

    it "should get edit" do
      get :edit, id: @task
      assert_response :success
    end

    it "should update task" do
      team = create(:team)
      @task.team.must_be_nil
      patch :update, id: @task, task: { team_id: team.id }
      assert_redirected_to tasks_path
      @task.reload.team.must_equal team
    end

    it "should prevent removing a task's title" do
      title= @task.title
      patch :update, id: @task, task: { title: '' }
      assert_response :success # Not redirect
      @task.reload.title.must_equal title
    end


    it "should destroy task" do
      assert_difference('Task.count', -1) do
        delete :destroy, id: @task
      end

      assert_redirected_to tasks_path
    end
  end
end
