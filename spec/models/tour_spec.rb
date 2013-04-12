require 'spec_helper'

describe Tour do
  let(:tour) {FactoryGirl.create(:tour)}
  let(:user) {FactoryGirl.create(:user)}
  describe ".new" do
    it 'creates a new Tour object' do
      tour = Tour.new
      expect(tour).to be_an_instance_of(Tour)
    end
  end

  describe '.create' do
    it 'creates a Tour record in the db' do
      tour = Tour.create
      expect(tour.id).to_not eq nil
    end
  end

  describe 'attributes' do
    it 'has basic properties' do
      expect(tour.name).to eq 'New York'
      expect(tour.description).to eq "See the many wonders of New York"
      expect(tour.lat).to eq 0.0
      expect(tour.lng).to eq 0.0
      expect(tour.image).to eq ''
      expect(tour.price).to eq 3.00
    end
  end

  describe '#user' do
    it 'has one user' do
      user.tours << tour
      expect(tour.user).to eq user
    end
  end
end