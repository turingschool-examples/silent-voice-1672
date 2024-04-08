require 'rails_helper'

RSpec.describe 'movies show page', type: :feature do
  describe ' USER STORY #2' do
    describe 'as a user when I visit /movies/:id' do
      before(:each) do
        @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")

        @ts = @universal.movies.create!(title: "Toy Story", creation_year: 1995, genre: "animation")

        @meryl = Actor.create!(name: "Meryl Streep", age: 73)
        @tom = Actor.create!(name: "Tom Hanks", age: 68)
        @tim = Actor.create!(name: "Tim Allen", age: 63)

        @ts.actors << [@meryl, @tom]
        visit "/movies/#{@ts.id}"
      end
      it 'displays movies attributes' do
        expect(page).to have_content(@ts.title)
        expect(page).to have_content(@ts.creation_year)
        expect(page).to have_content(@ts.genre)
      end

      it "displays all actors from youngest to oldest" do
        expect(@tim.name).to appear_before(@tom.name)
        expect(@tom.name).to appear_before(@meryl.name)
      end

      it "displays average age of all actors" do
        expect(page).to have_content("Average Age: 68")
      end
    end 
  end
end