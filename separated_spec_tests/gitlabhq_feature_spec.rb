require 'spec_helper'

describe Feature do
  describe '.get' do
    let(:feature) { double(:feature) }
    let(:key) { 'my_feature' }

    it 'returns the Flipper feature' 

  end

  describe '.persisted_names' do
    it 'returns the names of the persisted features' 


    it 'returns an empty Array when no features are presisted' 


    it 'caches the feature names when request store is active', :request_store do
      Feature::FlipperFeature.create!(key: 'foo')

      expect(Feature::FlipperFeature)
        .to receive(:feature_names)
        .once
        .and_call_original

      2.times do
        expect(described_class.persisted_names).to eq(%w[foo])
      end
    end
  end

  describe '.persisted?' do
    it 'returns true for a persisted feature' 


    it 'returns false for a feature that is not persisted' 

  end

  describe '.all' do
    let(:features) { Set.new }

    it 'returns the Flipper features as an array' 

  end
end

