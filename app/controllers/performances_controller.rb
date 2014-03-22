class PerformancesController < ApplicationController





  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)

    if @performance.save
      redirect_to root_path
    else
      redirect_to :new
    end
  end

  def show
    find_performance
  end

  def edit
    find_performance
  end

  def update
    find_performance

    if @performance.update(performance_params)
      redirect_to root_path
    else
      redirect_to edit_performance_path
    end
  end

  def destroy
    find_performance

    if @performance.destroy
      redirect_to root_path
    else
      redirect_to :show
    end
  end

  private
  def performance_params
    params.require(:performance).permit(:location, :date)
  end

  def find_performance
    @performance = Performance.find(params[:id])
  end

end
