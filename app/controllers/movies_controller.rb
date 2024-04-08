class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end  

  def update
    @movie = Movie.find(params[:id])
    add_actor = Actor.find(params[:actor_id])
    @movie.actors << add_actor
    redirect_to "/movies/#{@movie.id}"
  end

  private

  def actor_params
    params.permit(:actor_id)
  end
end