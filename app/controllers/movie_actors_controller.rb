class MovieActorsController < ApplicationController
  def create
    MovieActor.create!(create_movie_actor_params)

    redirect_to("/movies/#{params[:movie_id]}")
  end

  private

  def create_movie_actor_params
    params.permit(:actor_id, :movie_id)
  end
end
