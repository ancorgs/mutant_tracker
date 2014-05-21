#
# Controller for teams' CRUD
#
class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy]
  respond_to :html

  # GET /teams
  def index
    @q = Team.search(params[:q])
    @teams = @q.result(distinct: true)
  end

  # GET /teams/new
  def new
    @team = @resource = Team.new
  end

  # POST /teams
  def create
    @team = @resource = Team.new(team_params)
    if @team.save
      redirect_to teams_url, notice: I18n.t('model.created', model: 'team')
    else
      render :new
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      redirect_to teams_url, notice: I18n.t('model.updated', model: 'team')
    else
      render :edit
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    redirect_to teams_url, notice: I18n.t('model.destroyed', model: 'team')
  end

  private
    # Callback to instantiate variables common to all methods
    def set_team
      @team = @resource = Team.find(params[:id])
    end

    # White-lists expected parameters
    def team_params
      params.require(:team).permit(:name, mutant_ids: [])
    end
end
