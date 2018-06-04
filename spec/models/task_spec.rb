require 'rails_helper'

RSpec.describe Task, type: :model do
  attributes = [:title, :priority]

  describe 'validations' do
    attributes.each {|attr| it {should validate_presence_of attr}}
  end

  describe 'attributes' do
    attributes.each {|attr| it {should respond_to attr}}
    it {should respond_to(:body)}
  end

  describe 'relation' do
    it {should belong_to(:list)}
  end
end
