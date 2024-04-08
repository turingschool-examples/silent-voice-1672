class MoviesController < ApplicationController

  def show
    p params
    @movie = Movie.find(params[:id])
  end

end
