require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Stages do
  let(:entry) { described_class.new(config) }

  describe 'validations' do
    context 'when entry config value is correct' do
      let(:config) { [:stage1, :stage2] }

      describe '#value' do
        it 'returns array of stages' 

      end

      describe '#valid?' do
        it 'is valid' 

      end
    end

    context 'when entry value is not correct' do
      let(:config) { { test: true } }

      describe '#errors' do
        it 'saves errors' 

      end

      describe '#valid?' do
        it 'is not valid' 

      end
    end
  end

  describe '.default' do
    it 'returns default stages' 

  end
end

