class Studio < ApplicationRecord
  has_many :movies
  has_many :actors, through: :movies

  # def self.unique_actors
  #   where()
  # end
end
