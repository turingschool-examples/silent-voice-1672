class MovieActorsController < ApplicationController 
  def create
    @individual_movie = Movie.find(params[:id])
    new_actor = @individual_movie.actors.new(actor_params)
    new_actor.save

    redirect_to "/movies/#{@individual_movie.id}"
  end

  def actor_params
    params.permit(:name, :age)
  end
end