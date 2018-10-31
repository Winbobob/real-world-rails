# encoding: utf-8

require_relative '../../spec_helper_min.rb'
require_relative '../../../lib/carto/bolt.rb'

module Carto
  describe Bolt do
    before(:each) do
      @bolt = Carto::Bolt.new('manolo_bolt_locked')
    end

    it 'should expect block' 


    it 'should allow access in block if locked and unlocked automatically' 


    it 'should not allow access if locked' 


    it 'should expire a lock after ttl_ms' 

  end
end

