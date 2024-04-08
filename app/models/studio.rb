class Studio < ApplicationRecord
  has_many :movies
  has_many :actors, through: :movies

  def unique_actors_list
    actors.distinct
  end
end
