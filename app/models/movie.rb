class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def youngest_to_oldest_actors
    actors.order(:age)
  end

  def average_actor_age
    actors.average(:age).round(2)
  end
end
