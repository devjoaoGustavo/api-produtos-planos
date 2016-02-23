class PeriodicitiesController < ApplicationController
  def create
    # @periodicity = Periodicity.create(periodicity_params)
    @periodicity = Periodicity.create(name: params[:name], deadline: params[:deadline])
    respond_with @periodicity
  end

  def show
    @periodicity = Periodicity.find(params[:id])
    respond_with @periodicity
  end

  def index
    @periodicities = Periodicity.all
    respond_with @periodicities
  end

  def update
    @periodicity = Periodicity.find(params[:id])
    @periodicity.update(periodicity_params)
    respond_with @periodicity
  end

  private

  def periodicity_params
    params.require(:periodicity).permit(:name, :deadline)
  end
end
