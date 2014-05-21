#
# Controller for mutants' CRUD
#
class MutantsController < ApplicationController
  before_action :set_mutant, only: [:edit, :update, :destroy]
  respond_to :html

  # GET /mutants
  def index
    @q = Mutant.search(params[:q])
    @mutants = @q.result(distinct: true)
  end

  # GET /mutants/new
  def new
    @mutant = @resource = Mutant.new
  end

  # POST /mutants
  def create
    @mutant = @resource = Mutant.new(mutant_params)
    if @mutant.save
      redirect_to mutants_url, notice: I18n.t('model.created', model: 'mutant')
    else
      render :new
    end
  end

  # PATCH/PUT /mutants/1
  def update
    if @mutant.update(mutant_params)
      redirect_to mutants_url, notice: I18n.t('model.updated', model: 'mutant')
    else
      render :edit
    end
  end

  # DELETE /mutants/1
  def destroy
    @mutant.destroy
    redirect_to mutants_url, notice: I18n.t('model.destroyed', model: 'mutant')
  end

  private
    # Callback to instantiate variables common to all methods
    def set_mutant
      @mutant = @resource = Mutant.find(params[:id])
    end

    # White-lists expected parameters
    def mutant_params
      params.require(:mutant).permit(:name, :superpowers, team_ids: [])
    end
end
