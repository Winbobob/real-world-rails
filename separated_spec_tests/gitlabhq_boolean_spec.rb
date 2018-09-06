require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Boolean do
  let(:entry) { described_class.new(config) }

  describe 'validations' do
    context 'when entry config value is valid' do
      let(:config) { false }

      describe '#value' do
        it 'returns key value' 

      end

      describe '#valid?' do
        it 'is valid' 

      end
    end

    context 'when entry value is not valid' do
      let(:config) { ['incorrect'] }

      describe '#errors' do
        it 'saves errors' 

      end
    end
  end
end

