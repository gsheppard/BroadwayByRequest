class SongsController < ApplicationController

  def new
    find_songs_musical
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.musical = find_songs_musical

    if @song.save
      redirect_to musical_path(find_songs_musical)
    else
      redirect_to :new
    end
  end

  def update

  end

  def destroy
    find_song

    if @song.destroy
      redirect_to musical_path(find_songs_musical)
    else
      redirect_to :back
    end
  end

  private
  def song_params
    params.require(:song).permit(:name)
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def find_songs_musical
    @musical = Musical.find(params[:musical_id])
    @musical
  end

end
