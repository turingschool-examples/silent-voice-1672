require "rails_helper"

RSpec.describe Actor, type: :model do
  it {should have_many :movie_actors}
  it {should have_many(:movies).through(:movie_actors)}
end