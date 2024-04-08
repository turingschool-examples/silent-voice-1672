class MovieActorsController < ApplicationController

 
  def create
    # require 'pry'; binding.pry
    @actors= MovieActor.create(id: params[:id], actor_id: params[:actor_id])

    redirect_to("/movies/#{params[:id]}")
  end
  
end