# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe AlaveteliRateLimiter::Backends::PStoreDatabase do

  let(:test_path) { Rails.root + '/tmp/test.pstore' }

  after(:each) do
    File.delete(test_path) if File.exist?(test_path)
  end

  describe '.new' do

    it 'requires a path' 


    it 'initializes a PStore at the given path' 


    it 'converts a string path to a pathname' 


  end

  describe '#get' do

    it 'returns the values for the key' 


    it 'only includes values recorded for the given key' 


  end

  describe '#set' do

    it 'sets a new record for the given keys' 


    it 'overrides the records for the given keys' 


  end

  describe '#record' do

    it 'records an event for a given IP and event' 


  end

  describe '#==' do

    it 'is equal if the pstore paths are the same' 


    it 'is not equal if the pstore paths are different' 


  end

  describe '#destroy' do

    it 'destroys the pstore' 


    it 'does not attempt to destroy the pstore if it does not yet exist' 


  end

end

