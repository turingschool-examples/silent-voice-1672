class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @actors_sorted_by_age = @movie.sort_actors_by_age
    @average_age_of_actors = @movie.average_age_of_actors
  end

  def update
    @movie = Movie.find(params[:id])

    if params[:actor_id].present?
      actor = Actor.find_by(id: params[:actor_id])
      @movie.add_actor(actor.id)

      redirect_to @movie
    end
  end
end