require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Unspecified do
  let(:unspecified) { described_class.new(entry) }
  let(:entry) { spy('Entry') }

  describe '#valid?' do
    it 'delegates method to entry' 

  end

  describe '#errors' do
    it 'delegates method to entry' 

  end

  describe '#value' do
    it 'delegates method to entry' 

  end

  describe '#specified?' do
    it 'is always false' 

  end
end

