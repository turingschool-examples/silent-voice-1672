class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.sorted_by_age
    Actor.order(:age)
  end
end