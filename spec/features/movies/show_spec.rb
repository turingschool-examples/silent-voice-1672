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

        @ts.actors << [@meryl, @tom, @tim]
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

      it "can add an actor to movie" do
        @nate = Actor.create!(name: "Nathan Lane", age: 67)
        # I do not see any actors listed that are not part of the movie
        expect(page).to_not have_content(@nate.name)

        #   And I see a form to add an actor to this movie
        expect(page).to have_field("Name")
        expect(page).to have_button("Submit Actor")

        #   When I fill in the form with the ID of an actor that exists in the database
        # fill_in :title, with: @nate.name
        # fill_in :age, with: @nate.age
        fill_in "actor", with: @nate.id

        #   And I click submit
        click_button "Submit Actor"

        #   Then I am redirected back to that movie's show page
        expect(current_path).to eq("/movies/#{@ts.id}")

        #   And I see the actor's name is now listed
        expect(page).to have_content(@nate.name)
      end
    end 
  end
end