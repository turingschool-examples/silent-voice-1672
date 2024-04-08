class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors_sorted_by_age
    @average_age = @movie.average_actor_age
  end
end