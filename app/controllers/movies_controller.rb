class MoviesController < ApplicationController

  def show
    @actor = Actor.find(params[:age])
  end

end
