require "rails_helper"

RSpec.describe "studios index page" do

  # User Story 1
  it 'studios index lists all studios and studio movies' do
    @new_studio = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @new_studio.movies.create!(title: "Kick-Ass", creation_year: "2010", genre: "comedy", studio_id: 1)
    @new_studio.movies.create!(title: "Get Out", creation_year: "2017", genre: "horror", studio_id: 1)
    
    visit "/studios"
    #save_and_open_page

    within "#studio_#{@new_studio.id}" do
      expect(page).to have_content("Universal Studios")
    end

    within "#studio_#{@new_studio.id}_movies" do
      expect(page).to have_content("Movie Title: Kick-Ass")
      expect(page).to have_content("Year: 2010")
      expect(page).to have_content("Genre: comedy")
    end 
  end

end