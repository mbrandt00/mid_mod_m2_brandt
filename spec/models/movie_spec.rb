require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many(:actors).through(:roles) }
    it { should have_many :roles }
  end
  describe 'average_age_of_actors' do 
    it 'should return the average of a collection of actors' do 
      @actor_1 = Actor.create!(name: 'Montgomery Clift', age: 25)
      @actor_2 = Actor.create!(name: 'Frank Sinatra', age: 30)
      @actor_3 = Actor.create!(name: 'Frank Sinatra', age: 35)
      @studio_1 = Studio.create!(name: 'MGM', location: 'Hollywood CA', created_at: Time.new, updated_at: Time.new)
      @movie_1 = @studio_1.movies.create!(title: "From Here To Eternity", creation_year: 1953, genre: 'romance', studio_id: @studio_1.id, created_at: Time.new, updated_at: Time.new)
      @movie_1.roles.create(name: "Robert E Lee Prewitt", actor_id: @actor_1.id)
      @movie_1.roles.create(name: "Maggio", actor_id: @actor_2.id)
      @movie_1.roles.create(name: "Paul", actor_id: @actor_3.id)
      expect(@movie_1.average_age_of_actors).to eq(30)
    end
  end
end