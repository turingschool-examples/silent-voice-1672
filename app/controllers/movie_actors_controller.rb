class MovieActorsController < ApplicationController
  def create
    movie_actor = MovieActor.new(create_movie_actor_params)

    unless movie_actor.save
      flash[:alert] = "Error: #{movie_actor.errors.full_messages}"
    end

    redirect_to("/movies/#{params[:movie_id]}")
  end

  private

  def create_movie_actor_params
    params.permit(:actor_id, :movie_id)
  end
end
