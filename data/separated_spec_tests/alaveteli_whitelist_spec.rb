# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe AlaveteliRateLimiter::IPRateLimiter::Whitelist do

  describe '.new' do

    it 'sets an empty whitelist by default' 


    it 'takes a single item' 


    it 'takes several items' 


    it 'removes duplicate items' 


    it 'converts from a string item' 


    it 'converts from string items' 


    it 'raises an error for an invalid address' 


    it 'raises an error for an invalid address in a list' 


  end

  describe '#include?' do

    it 'returns true if an address is whitelisted' 


    it 'returns false if an address is not whitelisted' 


    it 'allows an IPAddr address' 


    it 'raises an error for an invalid address' 


  end

  describe '#==' do

    it 'returns true if the address list is the same' 


    it 'returns false if the address list is different' 


  end

end

