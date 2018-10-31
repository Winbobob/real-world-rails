require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Jobs do
  let(:entry) { described_class.new(config) }

  describe 'validations' do
    before do
      entry.compose!
    end

    context 'when entry config value is correct' do
      let(:config) { { rspec: { script: 'rspec' } } }

      describe '#valid?' do
        it 'is valid' 

      end
    end

    context 'when entry value is not correct' do
      describe '#errors' do
        context 'incorrect config value type' do
          let(:config) { ['incorrect'] }

          it 'returns error about incorrect type' 

        end

        context 'when job is unspecified' do
          let(:config) { { rspec: nil } }

          it 'reports error' 

        end

        context 'when no visible jobs present' do
          let(:config) { { '.hidden'.to_sym => { script: [] } } }

          it 'returns error about no visible jobs defined' 

        end
      end
    end
  end

  context 'when valid job entries composed' do
    before do
      entry.compose!
    end

    let(:config) do
      { rspec: { script: 'rspec' },
        spinach: { script: 'spinach' },
        '.hidden'.to_sym => {} }
    end

    describe '#value' do
      it 'returns key value' 

    end

    describe '#descendants' do
      it 'creates valid descendant nodes' 

    end

    describe '#value' do
      it 'returns value of visible jobs only' 

    end
  end
end

