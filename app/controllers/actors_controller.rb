class ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to actors_path
    else
      redirect_to :new
    end
  end

  def show
    find_actor
  end

  def edit
    find_actor
  end

  def update
    find_actor

    if @actor.update(actor_params)
      redirect_to actors_path
    else
      redirect_to edit_actor_path(@actor)
    end
  end

  def destroy
    find_actor

    if @actor.destroy
      redirect_to actors_path
    else
      redirect_to :show
    end
  end

  private
  def actor_params
    params.require(:actor).permit(
      :first_name, :last_name, :email, :phone
    )
  end

  def find_actor
    @actor = Actor.find(params[:id])
  end

end
