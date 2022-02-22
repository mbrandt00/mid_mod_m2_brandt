require 'rails_helper'

RSpec.describe Role do
  describe 'relationships' do
    it { should belong_to :actor }
    it { should belong_to :movie }
  end
end