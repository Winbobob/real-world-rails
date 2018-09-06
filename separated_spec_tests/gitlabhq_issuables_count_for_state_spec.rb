require 'spec_helper'

describe Gitlab::IssuablesCountForState do
  let(:finder) do
    double(:finder, count_by_state: { opened: 2, closed: 1 })
  end

  let(:counter) { described_class.new(finder) }

  describe '#for_state_or_opened' do
    it 'returns the number of issuables for the given state' 


    it 'returns the number of open issuables when no state is given' 


    it 'returns the number of open issuables when a nil value is given' 

  end

  describe '#[]' do
    it 'returns the number of issuables for the given state' 


    it 'casts valid states from Strings to Symbols' 


    it 'returns 0 when using an invalid state name as a String' 

  end
end

