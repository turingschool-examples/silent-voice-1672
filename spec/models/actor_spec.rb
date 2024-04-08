require "rails_helper"

RSpec.describe Actor, type: :model do
  before(:each) do
    Actor.destroy_all

    @actor1 = Actor.create(name: "Tom Hanks", age: 60)
    @actor2 = Actor.create(name: "Brad Pitt", age: 66)
    @actor3 = Actor.create(name: "Angelina Jolie", age: 50)
    @actor4 = Actor.create(name: "Meryl Streep", age: 70)
  end
  
  describe "relationships" do
    it {should have_many(:movie_actors)}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe "class methods" do
    it "can sort by age" do
      sorted_actors = Actor.sort_by_age

      expected_sorted_actors = [
        @actor3,
        @actor1,
        @actor2,
        @actor4
      ]

      expect(expected_sorted_actors).to eq(sorted_actors)
    end
  end
end
