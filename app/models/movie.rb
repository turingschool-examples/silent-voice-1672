class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors 

  def actors_age_order
    actors.order(age: :asc)
  end

  def actors_avg_age
    actors.average(:age).to_i
  end
end
