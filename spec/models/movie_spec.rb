require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it { should have_many :actors}
  end

  describe '#model method' do
    it 'have an average age' do
     studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
     studio2 = Studio.create!(name: "Studio2", location: "Denver")
  
     movie1 =studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation") 
     movie2 =studio1.movies.create!(title: "Cars", creation_year: "2004", genre: "animation") 
     movie3 =studio2.movies.create!(title: "King Kong", creation_year: "1990", genre: "fiction") 
  
      actor1 = movie1.actors.create!(name: "Woody", age: 40)
      actor2 = movie1.actors.create!(name: "Buzz", age: 39)
      actor3 = movie1.actors.create!(name: "Mr. Patato", age: 20)
      actor4 = movie2.actors.create!(name: "Woody", age: 40)
      actor5 = movie2.actors.create!(name: "Lightning McQueen", age: 20)
      actor6 = movie3.actors.create!(name: "Kong", age: 60)
    

      expect(movie1.average_age).to_not eq(2)
      expect(movie1.average_age).to eq(33)
    end
  end
end
