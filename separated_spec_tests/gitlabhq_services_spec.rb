require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Services do
  let(:entry) { described_class.new(config) }

  before do
    entry.compose!
  end

  context 'when configuration is valid' do
    let(:config) { ['postgresql:9.5', { name: 'postgresql:9.1', alias: 'postgres_old' }] }

    describe '#valid?' do
      it 'is valid' 

    end

    describe '#value' do
      it 'returns valid array' 

    end
  end

  context 'when configuration is invalid' do
    let(:config) { 'postgresql:9.5' }

    describe '#valid?' do
      it 'is invalid' 

    end
  end
end

