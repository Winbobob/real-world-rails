require 'spec_helper'

describe Turnip::Table do
  let(:table) { described_class.new( raw ) }
  let(:raw) { [['foo', 'bar'], ['quox', '42']] }

  describe '#raw' do
    it 'returns the raw table' 


    it 'reflects changes in the raw table' 

  end

  describe '#to_a' do
    it 'returns the raw table' 

  end

  describe '#headers' do
    it 'returns the first row' 

  end

  describe '#rows' do
    let(:raw) { [['foo', 'bar'], ['moo', '55'], ['quox', '42']] }
    it 'returns the rows beyond the first' 

  end

  describe '#hashes' do
    let(:raw) { [['foo', 'bar'], ['moo', '55'], ['quox', '42']] }
    it 'returns a list of hashes based on the headers' 

  end

  describe '#transpose' do
    context "when table is 2 columns wide" do

      let(:raw) { [["Name", "Dave"], ["Age", "99"], ["Height", "6ft"]] }
      it 'transposes the raw table' 

    end
  end

  describe '#rows_hash' do
    let(:raw) { [['foo', 'moo'], ['bar', '55']] }
    it 'converts this table into a Hash where the first column is used as keys and the second column is used as values' 


    context "when table is greater than 2 columns wide" do

      let(:raw) { [["a", "b", "c"], ["1", "2", "3"]] }

      it 'raises an error' 

    end
  end

  describe '#map' do
    let(:raw) { [['moo', '55'], ['quox', '42']] }
    it 'iterates over the raw table' 

  end

  describe '#map_column!' do
    let(:raw) { [['name', 'age'], ['Dave', '31'], ['John', '45']] }
    it 'iterates through the column value and assigns it the value returned by the block' 


    context 'with undefined column' do

      it 'raies an error' 

      it 'not raises an error when the strict param is false' 

    end
  end

end

