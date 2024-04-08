class MovieActorsController < ApplicationController
  def create
    movie_actor = MovieActor.create(movie_actor_params)

    redirect_to "/movies/#{params[:movie_id]}"
  end

  private
  def movie_actor_params
    params.permit(:actor_id, :movie_id)
  end
end