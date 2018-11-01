require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Image do
  let(:entry) { described_class.new(config) }

  context 'when configuration is a string' do
    let(:config) { 'ruby:2.2' }

    describe '#value' do
      it 'returns image hash' 

    end

    describe '#errors' do
      it 'does not append errors' 

    end

    describe '#valid?' do
      it 'is valid' 

    end

    describe '#image' do
      it "returns image's name" 

    end

    describe '#entrypoint' do
      it "returns image's entrypoint" 

    end
  end

  context 'when configuration is a hash' do
    let(:config) { { name: 'ruby:2.2', entrypoint: %w(/bin/sh run) } }

    describe '#value' do
      it 'returns image hash' 

    end

    describe '#errors' do
      it 'does not append errors' 

    end

    describe '#valid?' do
      it 'is valid' 

    end

    describe '#image' do
      it "returns image's name" 

    end

    describe '#entrypoint' do
      it "returns image's entrypoint" 

    end
  end

  context 'when entry value is not correct' do
    let(:config) { ['ruby:2.2'] }

    describe '#errors' do
      it 'saves errors' 

    end

    describe '#valid?' do
      it 'is not valid' 

    end
  end

  context 'when unexpected key is specified' do
    let(:config) { { name: 'ruby:2.2', non_existing: 'test' } }

    describe '#errors' do
      it 'saves errors' 

    end

    describe '#valid?' do
      it 'is not valid' 

    end
  end
end

