class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  validates :title, presence: true
  validates :creation_year, presence: true
  validates :genre, presence: true

  def actors_ordered_by_age
    actors.order(age: :asc)
  end

  def average_actor_age
    actors.average(:age).round(2)
  end
end
