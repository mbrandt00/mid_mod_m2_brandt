require 'rails_helper'

RSpec.describe 'Studio Index Page' do 
    before(:each) do 
    @studio_1 = Studio.create!(name: 'MGM', location: 'Hollywood CA', created_at: Time.new, updated_at: Time.new)
    @movie_1 = @studio_1.movies.create!(title: "From Here To Eternity", creation_year: 1953, genre: 'romance', studio_id: @studio_1.id, created_at: Time.new, updated_at: Time.new)
    @actor_1 = Actor.create!(name: 'Montgomery Clift', age: 25)
    @actor_2 = Actor.create!(name: 'Frank Sinatra', age: 30)
    @movie_1.roles.create(name: "Robert E Lee Prewitt", actor_id: @actor_1.id)
    @movie_1.roles.create(name: "Maggio", actor_id: @actor_2.id)



    end 
    it "it will have the movie's info" do 
        visit "/movies/#{@movie_1.id}"
        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@movie_1.creation_year)
    end
    it 'will have the average age of actors' do 
        visit "/movies/#{@movie_1.id}"
        expect(page).to have_content(27.5)
    end
end
