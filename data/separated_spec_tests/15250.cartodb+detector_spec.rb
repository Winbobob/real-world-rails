# encoding: utf-8
require 'minitest/autorun'
require 'redis'
require_relative '../../spec_helper'
require_relative '../../../backend/detector'

include DataRepository

describe Backend::Detector do
  describe '#detect' do
    it 'returns a memory backend if no connection or backend passed' 


    it "returns the passed object if it's a backend" 


    it 'returns a redis backend if a redis connection is passed' 

  end #detect
end # Backend::Detector


