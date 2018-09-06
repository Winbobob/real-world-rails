require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Commands do
  let(:entry) { described_class.new(config) }

  context 'when entry config value is an array' do
    let(:config) { %w(ls pwd) }

    describe '#value' do
      it 'returns array of strings' 

    end

    describe '#errors' do
      it 'does not append errors' 

    end
  end

  context 'when entry config value is a string' do
    let(:config) { 'ls' }

    describe '#value' do
      it 'returns array with single element' 

    end

    describe '#valid?' do
      it 'is valid' 

    end
  end

  context 'when entry value is not valid' do
    let(:config) { 1 }

    describe '#errors' do
      it 'saves errors' 

    end
  end
end

