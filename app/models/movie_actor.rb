class MovieActor < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
  has_many :studios, through: :movie
end
