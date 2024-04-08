require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe "class methods" do
    describe "#sorted_by_age" do
      before do
        @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")

        @ts = @universal.movies.create!(title: "Toy Story", creation_year: 1995, genre: "animation")

        @meryl = Actor.create!(name: "Meryl Streep", age: 73)
        @tom = Actor.create!(name: "Tom Hanks", age: 68)
        @tim = Actor.create!(name: "Tim Allen", age: 63)

        @ts.actors << [@meryl, @tom, @tim]
      end

      it "sorts actors from youngest to oldest" do
        expect(Actor.sorted_by_age).to eq([@tim, @tom, @meryl])
      end

      it "gets average age of all actors" do
        expect(Actor.average_age).to eq(68)
      end
    end
  end
end
