require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Hidden do
  let(:entry) { described_class.new(config) }

  describe 'validations' do
    context 'when entry config value is correct' do
      let(:config) { [:some, :array] }

      describe '#value' do
        it 'returns key value' 

      end

      describe '#valid?' do
        it 'is valid' 

      end
    end

    context 'when entry value is not correct' do
      context 'when config is empty' do
        let(:config) { {} }

        describe '#valid' do
          it 'is invalid' 

        end
      end
    end
  end

  describe '#leaf?' do
    it 'is a leaf' 

  end

  describe '#relevant?' do
    it 'is not a relevant entry' 

  end
end

