class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors_sorted_by_age
    @average_age = @movie.average_actor_age
  end
    
    
  def update
    movie = Movie.find(params[:id])
    movie.movie_actors.create(actor_id: params[:actor_id])
    redirect_to "/movies/#{movie.id}"
  end
end