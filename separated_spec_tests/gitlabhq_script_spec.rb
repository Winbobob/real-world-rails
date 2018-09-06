require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Script do
  let(:entry) { described_class.new(config) }

  describe 'validations' do
    context 'when entry config value is correct' do
      let(:config) { %w(ls pwd) }

      describe '#value' do
        it 'returns array of strings' 

      end

      describe '#errors' do
        it 'does not append errors' 

      end

      describe '#valid?' do
        it 'is valid' 

      end
    end

    context 'when entry value is not correct' do
      let(:config) { 'ls' }

      describe '#errors' do
        it 'saves errors' 

      end

      describe '#valid?' do
        it 'is not valid' 

      end
    end
  end
end

