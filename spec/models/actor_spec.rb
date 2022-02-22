require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:movies).through(:roles) }
    it { should have_many :roles}
  end
  it 'should sort actors by age' do 
      actor_1 = Actor.create!(name: 'Montgomery Clift', age: 40)
      actor_2 = Actor.create!(name: 'Frank Sinatra', age: 30)
      actor_3 = Actor.create!(name: 'Ray Sinatra', age: 35)
      expect(Actor.by_age).to eq([actor_2, actor_3, actor_1])

  end
end