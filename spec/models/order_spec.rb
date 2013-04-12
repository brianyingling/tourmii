require 'spec_helper'

describe Order do
  let(:user) {FactoryGirl.create(:user)}
  let(:tour) {FactoryGirl.create(:tour)}
  describe '.new' do
    it 'creates a new Order object' do
      order = Order.new
      expect(order).to be_an_instance_of(Order)
    end
  end

  describe '.create' do
    it 'creates an Order object in the db' do
      order = Order.create
      tour.orders << order
      user.orders << order
      expect(tour.orders.first).to eq order
      expect(user.orders.first).to eq order
    end
  end

end