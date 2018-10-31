require 'spec_helper'

describe Feature do
  before do
    # We mock all calls to .enabled? to return true in order to force all
    # specs to run the feature flag gated behavior, but here we need a clean
    # behavior from the class
    allow(described_class).to receive(:enabled?).and_call_original
  end

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
    context 'when the feature is persisted' do
      it 'returns true when feature name is a string' 


      it 'returns true when feature name is a symbol' 

    end

    context 'when the feature is not persisted' do
      it 'returns false when feature name is a string' 


      it 'returns false when feature name is a symbol' 

    end
  end

  describe '.all' do
    let(:features) { Set.new }

    it 'returns the Flipper features as an array' 

  end

  describe '.flipper' do
    before do
      described_class.instance_variable_set(:@flipper, nil)
    end

    context 'when request store is inactive' do
      it 'memoizes the Flipper instance' 

    end

    context 'when request store is active', :request_store do
      it 'memoizes the Flipper instance' 

    end
  end

  describe '.enabled?' do
    it 'returns false for undefined feature' 


    it 'returns true for undefined feature with default_enabled' 


    it 'returns false for existing disabled feature in the database' 


    it 'returns true for existing enabled feature in the database' 


    context 'with an individual actor' do
      CustomActor = Struct.new(:flipper_id)

      let(:actor) { CustomActor.new(flipper_id: 'CustomActor:5') }
      let(:another_actor) { CustomActor.new(flipper_id: 'CustomActor:10') }

      before do
        described_class.enable(:enabled_feature_flag, actor)
      end

      it 'returns true when same actor is informed' 


      it 'returns false when different actor is informed' 


      it 'returns false when no actor is informed' 

    end
  end

  describe '.disable?' do
    it 'returns true for undefined feature' 


    it 'returns false for undefined feature with default_enabled' 


    it 'returns true for existing disabled feature in the database' 


    it 'returns false for existing enabled feature in the database' 

  end
end

