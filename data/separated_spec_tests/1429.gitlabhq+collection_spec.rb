require 'spec_helper'

describe Gitlab::Ci::Variables::Collection do
  describe '.new' do
    it 'can be initialized with an array' 


    it 'can be initialized without an argument' 

  end

  describe '#append' do
    it 'appends a hash' 


    it 'appends a Ci::Variable' 


    it 'appends an internal resource' 


    it 'returns self' 

  end

  describe '#concat' do
    it 'appends all elements from an array' 


    it 'appends all elements from other collection' 


    it 'returns self' 

  end

  describe '#+' do
    it 'makes it possible to combine with an array' 


    it 'makes it possible to combine with another collection' 

  end

  describe '#to_runner_variables' do
    it 'creates an array of hashes in a runner-compatible format' 

  end

  describe '#to_hash' do
    it 'returns regular hash in valid order without duplicates' 

  end
end

