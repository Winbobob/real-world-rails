require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Service do
  let(:entry) { described_class.new(config) }

  before do
    entry.compose!
  end

  context 'when configuration is a string' do
    let(:config) { 'postgresql:9.5' }

    describe '#valid?' do
      it 'is valid' 

    end

    describe '#value' do
      it 'returns valid hash' 

    end

    describe '#image' do
      it "returns service's image name" 

    end

    describe '#alias' do
      it "returns service's alias" 

    end

    describe '#command' do
      it "returns service's command" 

    end
  end

  context 'when configuration is a hash' do
    let(:config) do
      { name: 'postgresql:9.5', alias: 'db', command: %w(cmd run), entrypoint: %w(/bin/sh run) }
    end

    describe '#valid?' do
      it 'is valid' 

    end

    describe '#value' do
      it 'returns valid hash' 

    end

    describe '#image' do
      it "returns service's image name" 

    end

    describe '#alias' do
      it "returns service's alias" 

    end

    describe '#command' do
      it "returns service's command" 

    end

    describe '#entrypoint' do
      it "returns service's entrypoint" 

    end
  end

  context 'when entry value is not correct' do
    let(:config) { ['postgresql:9.5'] }

    describe '#errors' do
      it 'saves errors' 

    end

    describe '#valid?' do
      it 'is not valid' 

    end
  end

  context 'when unexpected key is specified' do
    let(:config) { { name: 'postgresql:9.5', non_existing: 'test' } }

    describe '#errors' do
      it 'saves errors' 

    end

    describe '#valid?' do
      it 'is not valid' 

    end
  end
end

