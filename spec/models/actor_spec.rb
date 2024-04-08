require "rails_helper"

RSpec.describe Actor, type: :model do
  before :each do
    @us = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @movie_1 = @us.movies.create!(title: 'Kick-Ass', creation_year: 2010, genre: "Comedy")
    @actor_2 = @movie_1.actors.create!(name: 'Omari Hardwick', age: 50)
    @actor_1 = @movie_1.actors.create!(name: 'Chloe Grace Moretz', age: 27)
  end

  describe "relationships" do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe "class methods" do
    it ".order_by_age" do
      test_var = @movie_1.actors.order_by_age
      
      expect(test_var.first).to eq(@actor_1)
    end

    it '.average_age' do
      a_age = @movie_1.actors.average_age

      expect(a_age).to eq(38.5)
    end
  end
end