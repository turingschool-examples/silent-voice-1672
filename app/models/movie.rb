class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_sorted_by_age
    actors.order(age: :asc)
  end

  def average_actor_age
    actors.average(:age).to_f
  end
end
