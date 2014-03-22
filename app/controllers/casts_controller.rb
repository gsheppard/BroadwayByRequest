class CastsController < ApplicationController

  def new
    find_set_list
    find_performance
    @cast = Cast.new
  end

  def create
    find_performance
    find_set_list
    cast_actors = find_active_actors

    @set_list.set_actors(cast_actors)
    redirect_to performance_path(@performance)
  end

  private
  def find_active_actors
    params[:cast][:actor_list].select { |key, value| value == "1"}.keys
  end

  def find_performance
    @performance = Performance.find(params[:performance_id])
  end

  def find_actor

  end

  def find_set_list
    @set_list = SetList.find(params[:set_list_id])
  end

end
