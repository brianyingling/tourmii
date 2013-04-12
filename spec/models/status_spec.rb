require 'spec_helper'

describe Status do
  describe '.new' do
    it 'creates a new object' do
      status = Status.new
      expect(status).to be_an_instance_of(Status)
    end
  end

  describe '.create' do
    it 'creates a Status record in the db' do
      status = Status.create
      expect(status.id).to_not be nil
    end
  end

  describe '#is_complete' do
    it 'is either complete or not complete' do
      status = Status.create
      status.is_complete = false
      status.save
      expect(status.is_complete).to eq false
    end
  end

  describe "#step" do
    it 'belongs to a step' do
      status = Status.create
      status.is_complete = false
      status.save
      step = Step.create
      step.statuses << status
      expect(step.statuses.first).to eq status
    end
  end

  describe '#user' do
    it 'has a user' do
      user = FactoryGirl.create(:user)
      status = Status.create(:is_complete=>false)
      status.user = user
      status.save
      expect(status.user).to eq user
    end
  end
end