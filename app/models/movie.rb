class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def sort_actors_by_age
    actors.order(age: :asc)
  end

  # rounding for easier testing
  def average_age_of_actors
    actors.average(:age).to_f.round(2)
  end

  def add_actor(actor_id)
    actor = Actor.find_by(id: actor_id)
    actors << actor
  end

end
