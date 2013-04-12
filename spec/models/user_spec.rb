# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  lat             :float
#  lng             :float
#  address         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.create(:user)}
  let(:tour) {FactoryGirl.create(:tour)}
  describe '.new' do
    it 'creates a new User object' do
      user = User.new
      expect(user).to be_an_instance_of(User)
    end
  end

  describe '.create' do
    it 'creates a User record in the db' do
      user = User.create()
      expect(user.id).to_not be nil
    end
  end

  describe 'parameters' do
    it 'has all of its properties' do
      expect(user.first_name).to eq "Bob"
      expect(user.last_name).to eq "Jones"
      expect(user.email).to eq "bob@gmail.com"
      expect(user.lat).to eq 0.0
      expect(user.lng).to eq 0.0
    end
  end

  describe "#tours" do
    it 'has an array of tours' do
      user.tours << tour
      expect(user.tours).to_not be nil
      expect(user.tours.first).to eq tour
    end
  end

end
