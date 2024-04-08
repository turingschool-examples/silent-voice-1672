class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @age_sorted_actors = @movie.actors.sort_by_age
  end
end