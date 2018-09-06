# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AlaveteliRateLimiter::IPRateLimiter do

  after(:each) do
    described_class.defaults!
  end

  describe '.defaults' do

    it 'sets the defaults' 


    it 'allows custom defaults to be set' 


  end

  describe '.new' do

    it 'requires a Rule' 


    it 'accepts a Rule' 


    it 'looks up a Symbol rule from the configured defaults' 


    it 'raises an error if a Symbol rule is not a configured default' 


    it 'creates a default backend' 


    it 'allows a custom backend' 


    it 'creates a default whitelist' 


    it 'allows a custom whitelist' 


  end

  describe '#rule' do

    it 'returns the rule attribute' 


  end

  describe '#whitelist' do

    it 'returns the whitelist attribute' 


  end

  describe '#backend' do

    it 'returns the backend attribute' 


  end

  describe '#records' do

    it 'returns the records in the backend' 


  end

  describe '#record' do

    it 'records an event for the IP in the backend' 


    it 'converts an IPAddr to a String key' 


    it 'cleans a poorly formatted IP' 


    it 'raises an error for an invalid IP address' 


  end

  describe '#record!' do

    it 'purges old records before recording the new event' 


  end

  describe '#limit?' do

    it 'returns false if the IP is in the whitelist' 


    it 'returns true if the records break the rule limit' 


    it 'returns false if the records are within the rule limit' 


  end

end

