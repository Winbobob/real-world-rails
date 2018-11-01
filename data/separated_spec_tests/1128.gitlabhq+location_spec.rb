require 'spec_helper'

describe Gitlab::Sherlock::Location do
  let(:location) { described_class.new(__FILE__, 1) }

  describe 'from_ruby_location' do
    it 'creates a Location from a Thread::Backtrace::Location' 

  end

  describe '#path' do
    it 'returns the file path' 

  end

  describe '#line' do
    it 'returns the line number' 

  end

  describe '#application?' do
    it 'returns true for an application frame' 


    it 'returns false for a non application frame' 

  end
end

