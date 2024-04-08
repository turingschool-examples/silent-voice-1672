class StudiosController < ApplicationController
  def index
    @all_studios = Studio.all
  end
end