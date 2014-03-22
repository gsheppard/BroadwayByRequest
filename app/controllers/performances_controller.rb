class PerformancesController < ApplicationController

  def new
    @performance = Performance.new
  end

  def show
    @performance = Performance.find(params[:id])
  end

  def edit
    @performance = Performance.find(params[:id])
  end

  def update
    @performance = Performance.find(params[:id])

    if @performance.update(performance_params)
      redirect_to root_path
    else
      redirect_to :new
    end
  end

  def destroy
    @performance = Performance.find(params[:id])

    if @performance.destroy
      redirect_to root_path
    else
      redirect_to :show
    end
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
