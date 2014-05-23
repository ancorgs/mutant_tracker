#
# Controller for tasks' CRUD
#
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_states, except: [:show, :destroy]
  respond_to :html

  # GET /tasks
  def index
    @q = Task.search(params[:q])
    @tasks = @q.result(distinct: true)
  end

  # GET /tasks/new
  def new
    @task = @resource = Task.new
    # Just in case the creation fails
    flash[:q] = params[:q]
  end

  # GET /task/1/edit
  def edit
    # Just in case the update fails
    flash[:q] = params[:q]
  end

  # POST /tasks
  def create
    @task = @resource = Task.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: I18n.t('model.created', model: 'task')
    else
      # Keep the filter between failures
      flash.keep(:q)
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to tasks_url, notice: I18n.t('model.updated', model: 'task')
    else
      # Keep the filter between failures
      flash.keep(:q)
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: I18n.t('model.destroyed', model: 'task')
  end

  private
    # Callback to instantiate variables common to all methods
    def set_task
      @task = @resource = Task.find(params[:id])
    end

    # Callback to instantiate the list of available states
    def set_states
      @states = TaskState.all.sort_by(&:order)
    end

    # White-lists expected parameters
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :team_id, :state_id)
    end
end
