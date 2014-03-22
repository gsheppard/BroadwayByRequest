class PagesController < ApplicationController

  def index
    @performances = Performance.all
  end

end
