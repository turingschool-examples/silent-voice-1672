class MovieActorsController < ApplicationController
  def create
    @movie_actor = MovieActor.new(movie_id: params[:id], actor_id: params[:actor])
    if @movie_actor.save
      redirect_to "/movies/#{params[:id]}"
    end
  end
end