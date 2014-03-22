class PerformancesController < ApplicationController

  def new
    @performance = Performance.new
  end

  def show
    @performance = Performance.find(params[:id])
  end

  def create
    @performance = Performance.new(performance_params)

    if @performance.save
      redirect_to root_path
    else
      redirect_to :new
    end
  end

  private
  def performance_params
    params.require(:performance).permit(:location, :date)
  end

end
