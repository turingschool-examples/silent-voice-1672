class StudiosController < ApplicationController
  def index
    @studios = Studio.all.includes(:movies)
  end
end