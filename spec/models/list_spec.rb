require 'rails_helper'

RSpec.describe List, type: :model do
  attributes = [:title, :priority]

  describe 'attributes' do
    attributes.each {|attr| it {should respond_to attr}}
  end

  describe 'validations' do
    attributes.each {|val| it {should validate_presence_of val}}
  end

  describe 'relations' do
    it {should belong_to(:board)}
    it {should have_many(:tasks)}
  end


end
