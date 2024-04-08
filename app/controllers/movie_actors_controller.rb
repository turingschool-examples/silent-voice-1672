class MovieActorsController < ApplicationController
  def create
    movie_actor = MovieActor.new(create_movie_actor_params)

    flash[:alert] = "Error: invalid input" unless movie_actor.save

    redirect_to("/movies/#{params[:movie_id]}")
  end

  private

  def create_movie_actor_params
    params.permit(:actor_id, :movie_id)
  end
end
