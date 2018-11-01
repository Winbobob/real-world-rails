require_relative 'spec_helper'
require 'stringio'
require 'pathname'

module Aws
  describe 'VERSION' do

    it 'is a semver compatible string' 


  end

  describe '.config' do

    it 'defaults to an empty hash' 


    it 'does not allow assigning config object to non-hash objects' 


  end

  describe '.use_bundled_cert!' do

    after(:each) do
      Aws.config = {}
    end

    it 'configures a default ssl cert bundle' 


    it 'replaced any other default ssl ca' 


  end

  describe '.empty_connection_pools!' do
    it 'closes any existing sessions' 

  end
end

