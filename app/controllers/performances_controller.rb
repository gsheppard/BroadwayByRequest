class PerformancesController < ApplicationController

  def new
    @performance = Performance.new
  end

  def create
    binding.pry
    @performance = Performance.new(performance_params)
  end

  private
  def performance_params
    params.require(:performance).permit(:location, :date)
  end

end
