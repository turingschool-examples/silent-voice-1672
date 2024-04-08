class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def average_age
    actors.average(:age).round(2)
  end

  def sorted_actors_age
    actors.order(age: :asc)    
  end
end
