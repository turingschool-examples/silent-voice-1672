require "rails_helper"

RSpec.describe Movie, type: :model do
  before :each do
    @universal = Studio.create!(name: "Universal Studios", location: "Los Angeles")
    
    @water_b = @universal.movies.create!(title: "Water Boy", creation_year: 1997, genre: "Comedy")
  
    @adam = Actor.create!(name: "Adam Sandler", age: 28)
    @woman = Actor.create!(name: "Girlfriend", age: 24)

    @movie_actor_1 = MovieActor.create!(movie_id: @water_b.id, actor_id: @adam.id)
    @movie_actor_2 = MovieActor.create!(movie_id: @water_b.id, actor_id: @woman.id)
  end
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many(:movie_actors)}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe "instance methods" do
    describe "#actors_age_order" do
      it "orders actors by age youngest to oldest" do
        expect(@water_b.actors_age_order).to eq([@woman, @adam])
      end
    end

    describe "#actors_avg_age" do
      it "averages the age of actors in a movie" do
        expect(@water_b.actors_avg_age).to eq(26)
      end
    end
  end

end
