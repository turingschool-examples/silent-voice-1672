class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @actors_sorted_by_age = @movie.sort_actors_by_age
    @average_age_of_actors = @movie.average_age_of_actors
  end
end