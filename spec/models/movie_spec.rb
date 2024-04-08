require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  before(:each) do
    @studio1 = Studio.create!(name: "Studios California", location: "Beverlly Hills")
    @actor1 = Actor.create!(name: "Leonardo DiCaprio", age: 46)
    @actor2 = Actor.create!(name: "Kate Winslet", age: 45)
    @movie1 = @studio1.movies.create!(title: "Titanic", creation_year: "1998", genre: "Romantic")
    @movie_actor_1 = MovieActor.create!(movie_id: @movie1.id, actor_id: @actor1.id)
    @movie_actor_2 = MovieActor.create!(movie_id: @movie1.id, actor_id: @actor2.id)
  end

  describe "#actors_sorted_by_age" do
    it "returns actors sorted by age in ascending order" do
      sorted_actors = @movie1.actors_sorted_by_age
      expect(sorted_actors.first).to eq(@actor2)
      expect(sorted_actors.last).to eq(@actor1)
    end
  end

  describe "#average_actor_age" do
    it "returns the average age of associated actors" do
      expect(@movie1.average_actor_age).to eq(45.5)
    end
  end
end
