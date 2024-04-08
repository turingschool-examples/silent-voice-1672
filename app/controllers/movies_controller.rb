class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @sorted_actors = @movie.sorted_actors_age
    @average_age = @movie.average_age
  end
end
