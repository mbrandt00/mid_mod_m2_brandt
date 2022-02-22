require 'rails_helper'

RSpec.describe 'Studio Index Page' do 
    before(:each) do 
        @studio_1 = Studio.create(name: 'MGM', location: 'Hollywood CA', created_at: Time.new, updated_at: Time.new)
        @movie_1 = @studio_1.movies.create!(title: "From Here To Eternity", creation_year: 1953, genre: 'romance', studio_id: @studio_1.id, created_at: Time.new, updated_at: Time.new)
        @actor_1 = Actor.create!(name: 'Montgomery Clift', age: 25)
        @actor_2 = Actor.create!(name: 'Frank Sinatra', age: 30)
        @movie_1.roles.create(name: "Robert E Lee Prewitt", actor_id: @actor_1.id)
        @movie_1.roles.create(name: "Maggio", actor_id: @actor_2.id)

    end
    it 'will show the name and location of a studio' do 
        visit "/studios/"
        expect(page).to have_content(@studio_1.name)
        expect(page).to have_content(@studio_1.location)
    end
    it 'will show all of its movies underneath' do 
        visit "/studios/"
        expect(page).to have_content(@movie_1.title)
    end
end