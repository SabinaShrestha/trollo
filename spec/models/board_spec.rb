require 'rails_helper'

RSpec.describe Board, type: :model do

  describe 'attributes' do
    it {should respond_to(:title)}
  end

  describe 'validations' do
    it {should validate_presence_of(:title)}
  end

  describe 'relation' do
    it {should have_many(:lists)}
  end
end
