# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AlaveteliRateLimiter::Window do

  describe '.from_hash' do

    it 'creates a Window from a Hash' 


    it 'requires a :value key' 


    it 'requires a :unit key' 


  end

  describe '.new' do

    it 'requires a value' 


    it 'requires a numeric value' 


    it 'converts a numeric value to an Integer' 


    it 'requires a unit' 


    it 'requires a valid unit ' 


  end

  describe '#include?' do

    it 'returns true if an event is inside the window' 


    it 'returns false if the event is not inside the window' 


  end

  describe '#cutoff' do

    it 'calculates the end of the window based on the attributes' 


  end

  describe '#==' do

    it 'returns true if the value and unit are equal' 


    it 'returns false if the the value differs' 


    it 'returns false if the the unit differs' 


  end

end

