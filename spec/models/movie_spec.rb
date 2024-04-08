require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should belong_to :studio }
    it { should have_many :movie_actors }
    it { should have_many :actors }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:creation_year) }
    it { should validate_presence_of(:genre) }
  end

  before(:each) do
    @studio = Studio.create!(
      name: "Warner Bros.",
      location: "Burbank, CA"
    )
    @movie = @studio.movies.create!(
      title: "Dune",
      creation_year: "2021",
      genre: "Action/Adventure"
    )
    @actor1 = @movie.actors.create!(
      name: "Timothee Chalamet",
      age: 28
    )
    @actor2 = @movie.actors.create!(
      name: "Rebecca Ferguson",
      age: 40
    )
    @actor3 = @movie.actors.create!(
      name: "Zendaya Coleman",
      age: 27
    )
  end

  it "can list actors by age in ascending order" do
    expect(@movie.actors_ordered_by_age).to eq([
      @actor3,
      @actor1,
      @actor2
    ])
  end

  it "can calculate average actor age" do
    expect(@movie.average_actor_age).to eq(31.67)
  end
end
