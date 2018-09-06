require 'spec_helper'

describe Gitlab::DowntimeCheck::Message do
  describe '#to_s' do
    it 'returns an ANSI formatted String for an offline migration' 


    it 'returns an ANSI formatted String for an online migration' 

  end

  describe '#reason?' do
    it 'returns false when no reason is specified' 


    it 'returns true when a reason is specified' 

  end

  describe '#reason' do
    it 'strips excessive whitespace from the returned String' 

  end
end

