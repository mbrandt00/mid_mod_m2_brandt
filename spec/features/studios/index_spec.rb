require 'rails_helper'

RSpec.describe 'Studio Index Page' do 
    before(:each) do 
        @studio_1 = Studio.create(name: 'MGM', location: 'Hollywood CA', created_at: Time.new, updated_at: Time.new)
    end
    it 'will show the name and location of a studio' do 
        visit "/studios/"
        expect(page).to have_content(@studio_1.name)
        expect(page).to have_content(@studio_1.location)
    end
end