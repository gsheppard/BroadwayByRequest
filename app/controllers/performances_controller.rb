class PerformancesController < ApplicationController

  def new
    @performance = Performance.new
  end

end
