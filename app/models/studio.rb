class Studio < ApplicationRecord
  has_many :movies
  has_many :actors, through: :movies
  validates :name, presence: true
  validates :location, presence: true
end
