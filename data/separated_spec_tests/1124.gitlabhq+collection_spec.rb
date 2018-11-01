require 'spec_helper'

describe Gitlab::Sherlock::Collection do
  let(:collection) { described_class.new }

  let(:transaction) do
    Gitlab::Sherlock::Transaction.new('POST', '/cat_pictures')
  end

  describe '#add' do
    it 'adds a new transaction' 


    it 'is aliased as <<' 

  end

  describe '#each' do
    it 'iterates over every transaction' 

  end

  describe '#clear' do
    it 'removes all transactions' 

  end

  describe '#empty?' do
    it 'returns true for an empty collection' 


    it 'returns false for a collection with a transaction' 

  end

  describe '#find_transaction' do
    it 'returns the transaction for the given ID' 


    it 'returns nil when no transaction could be found' 

  end

  describe '#newest_first' do
    it 'returns transactions sorted from new to old' 

  end
end

