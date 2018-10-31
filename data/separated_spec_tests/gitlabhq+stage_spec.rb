require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Stage do
  let(:stage) { described_class.new(config) }

  describe 'validations' do
    context 'when stage config value is correct' do
      let(:config) { 'build' }

      describe '#value' do
        it 'returns a stage key' 

      end

      describe '#valid?' do
        it 'is valid' 

      end
    end

    context 'when value has a wrong type' do
      let(:config) { { test: true } }

      it 'reports errors about wrong type' 

    end
  end

  describe '.default' do
    it 'returns default stage' 

  end
end

