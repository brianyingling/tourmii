require 'spec_helper'

describe Step do
  let(:tour) {FactoryGirl.create(:tour)}
  let(:step1) {FactoryGirl.create(:step1)}
  let(:step2) {FactoryGirl.create(:step2)}
  let(:step3) {FactoryGirl.create(:step3)}
  describe '.new' do
    it 'creates a new Step object' do
      stop = Step.new
      expect(stop).to be_an_instance_of(Step)
    end
  end

  describe '.create' do
    it 'creates a Stop entry in the db' do
      step = Step.create
      expect(step.id).to_not be nil
    end
  end

  describe 'properties' do
    it 'has basic properties' do
      expect(step1.name).to eq 'Empire State Building'
      expect(step1.description).to eq "The tallest building in NYC"
      expect(step1.address).to eq "34th Street, New York, NY"
      expect(step1.lat).to eq 0.0
      expect(step1.lng).to eq 0.0
      expect(step1.position).to eq 1
      expect(step1.audiofile).to eq '/audios/audio.mp4'
    end
  end

  describe "#tour" do
    it 'belongs to a tour' do
      tour.steps << step1
      expect(step1.tour).to eq tour
    end
  end
  end