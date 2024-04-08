class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.sorted_by_age
    Actor.order(:age)
  end

  def self.average_age
    Actor.average(:age).to_i
  end
end