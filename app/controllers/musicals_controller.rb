class MusicalsController < ApplicationController

  def index
    @musicals = Musical.all
  end

  def new
    @musical = Musical.new
  end

  def create
    @musical = Musical.new(musical_params)

    if @musical.save
      redirect_to musicals_path
    else
      redirect_to :new
    end
  end

  def show
    find_musical
  end

  def edit
    find_musical
  end

  def update
    find_musical

    if @musical.update(musical_params)
      redirect_to musicals_path
    else
      redirect_to edit_musical_path
    end
  end

  def destroy
    find_musical

    if @musical.destroy
      redirect_to musicals_path
    else
      redirect_to :show
    end
  end

  private
  def musical_params
    params.require(:musical).permit(:name, :year)
  end

  def find_musical
    @musical = Musical.find(params[:id])
  end

end
