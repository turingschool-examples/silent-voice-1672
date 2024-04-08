class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors

  def average_age 
    actors.average(:age).round(0)
  end
end
