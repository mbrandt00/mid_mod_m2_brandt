require 'rails_helper'

RSpec.describe 'Studio Update Page' do 
    before(:each) do 
    @studio_1 = Studio.create!(name: 'MGM', location: 'Hollywood CA', created_at: Time.new, updated_at: Time.new)
    @movie_1 = @studio_1.movies.create!(title: "From Here To Eternity", creation_year: 1953, genre: 'romance', studio_id: @studio_1.id, created_at: Time.new, updated_at: Time.new)
    @actor_1 = Actor.create!(name: 'Montgomery Clift', age: 25)
    @actor_2 = Actor.create!(name: 'Frank Sinatra', age: 30)
    @movie_1.roles.create(name: "Robert E Lee Prewitt", actor_id: @actor_1.id)
    @movie_1.roles.create(name: "Maggio", actor_id: @actor_2.id)
    end 
    it 'will have a link to add an actor' do 
        visit "/movies/#{@movie_1.id}"
        expect(page).to have_link("Add Actor")
        click_link("Add Actor")
        expect(current_path).to eq("/movies/#{@movie_1.id}/update")
    end
    it 'can create a new actor' do 
        visit "/movies/#{@movie_1.id}"
        click_link("Add Actor")
        fill_in 'name', with: 'Bob'
        fill_in 'age', with: 19
        fill_in 'role', with: 'guard'
        click_on 'Create'
        expect(current_path).to eq("/movies/#{@movie_1.id}")
        expect(page).to have_content('Bob')
        expect(page).to have_content('guard')

    end
end
