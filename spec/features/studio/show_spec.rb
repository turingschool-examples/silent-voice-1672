# require 'rails_helper'

# RSpec.describe 'studio show page', type: :feature do
#   describe ' USER STORY extension' do
#     describe 'as a user when i visit /studio/:id' do
#       before(:each) do
#         @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")

#         @ts = @universal.movies.create!(title: "Toy Story", creation_year: 1995, genre: "animation")
#         @apollo = @universal.movies.create!(title: "Apollo 13", creation_year: 2003, genre: "Drama")

#         @meryl = Actor.create!(name: "Meryl Streep", age: 73)
#         @tom = Actor.create!(name: "Tom Hanks", age: 68)
#         @tim = Actor.create!(name: "Tim Allen", age: 63)
#         @nate = Actor.create!(name: "Nathan Lane", age: 71)

#         @ts.actors << [@meryl, @tom, @tim]

#         visit "/studios/#{@universal.id}"
#       end
#       it 'displays studios attributes' do
#         expect(page).to have_content(@universal.name)
#         expect(page).to have_content(@universal.location)
#       end
        
#       it 'displays list of actors who hae worked on any of this studios movies' do
#         expect(page).to have_content(@meryl.name)
#         expect(page).to have_content(@tom.name)
#         expect(page).to have_content(@tim.name)
#         expect(page).not_to have_content(@nate.name)
#         # And I see a unique list of all of the actors that have worked on any of this studio's movies.
#       end
#     end 
#   end
# end