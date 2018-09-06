# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AlaveteliRateLimiter::Rule do

  describe '.from_hash' do

    it 'constructs a Rule with associated Window from a Hash' 


    it 'requires a :name key' 


    it 'requires a :count key' 


    it 'requires a :window key' 


    it 'requires a :window hash with a :value key' 


    it 'requires a :window hash with a :unit key' 


  end

  describe '.new' do

    it 'requires a name' 


    it 'requires a name that can be converted in to a Symbol' 


    it 'requires a count' 


    it 'requires a window' 


    it 'requires count to be numeric' 


    it 'converts a numeric count to an Integer' 


  end

  describe '#limit?' do

    it 'returns true if the given records are over the limit' 


    it 'returns false if the given records are under the limit' 


    it 'does not matter if the records are in a different order' 


    it 'returns false if no records are given' 


  end

  describe '#records_in_window' do

    it 'returns records in the window' 


  end

  describe '#window' do

    it 'returns the window attribute' 


  end

  describe '#==' do

    it 'returns true if the count and window are equal' 


    it 'returns false if the the name differs' 


    it 'returns false if the the count differs' 


    it 'returns false if the the window differs' 


  end

end

