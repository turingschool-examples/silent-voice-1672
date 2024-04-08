require "rails_helper"

RSpec.describe Movie, type: :model do
  before :each do
    @studio1 = Studio.create(name: "Paramount Pictures", location: "Los Angeles, California")
    @godfather = Movie.create(title: "The Godfather", creation_year: "1972", genre: "Crime", studio: @studio1)

    @marlon_brando = Actor.create(name: "Marlon Brando", age: 50)
    @al_pacino = Actor.create(name: "Al Pacino", age: 40)
    @robert_de_niro = Actor.create(name: "Robert De Niro", age: 60)

    @godfather.actors << [@marlon_brando, @al_pacino, @robert_de_niro]
  end

  describe "relationships" do
    it {should belong_to :studio}
    it { should have_many(:actors).through(:actor_movies) }
  end

  it "#sort_actors_by_age" do
    expect(@godfather.sort_actors_by_age).to eq [@al_pacino, @marlon_brando, @robert_de_niro]
  end

  it "#average_age_of_actors" do
    expect(@godfather.average_age_of_actors).to eq 50.00
  end
end
