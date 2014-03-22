class SetListsController < ApplicationController

  def new
    find_performance
    @set_list = SetList.new
  end

  def create
    song_ids = active_songs
    find_performance
    if @performance.song_builder(song_ids)
      redirect_to performance_path(@performance)
    else
      redirect_to performance_path(@performance)
    end
  end

  def destroy
    find_performance
    @set_list = SetList.find(params[:id])

    @set_list.destroy
    redirect_to performance_path(@performance)
  end

  private
  def active_songs
    params[:set_list][:song_list].select { |key, value| value == "1"}.keys
  end

  def find_performance
    @performance = Performance.find(params[:performance_id])
  end
end
