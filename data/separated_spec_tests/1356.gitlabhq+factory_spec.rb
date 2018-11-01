require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Factory do
  describe '#create!' do
    let(:factory) { described_class.new(entry) }
    let(:entry) { Gitlab::Ci::Config::Entry::Script }

    context 'when setting a concrete value' do
      it 'creates entry with valid value' 


      context 'when setting description' do
        it 'creates entry with description' 

      end

      context 'when setting key' do
        it 'creates entry with custom key' 

      end

      context 'when setting a parent' do
        let(:object) { Object.new }

        it 'creates entry with valid parent' 

      end
    end

    context 'when not setting a value' do
      it 'raises error' 

    end

    context 'when creating entry with nil value' do
      it 'creates an unspecified entry' 

    end

    context 'when passing metadata' do
      let(:entry) { spy('entry') }

      it 'passes metadata as a parameter' 

    end
  end
end

