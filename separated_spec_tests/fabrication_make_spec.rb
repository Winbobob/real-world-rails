require 'spec_helper'
require 'fabrication/syntax/make'

describe Fabrication::Syntax::Make do

  describe "#make mongoid", depends_on: :mongoid do
    it "should return a fabricated object" 


    it "should overwrite options" 


    it "should treat a first non-hash argument as fabrication name suffix" 


    it "should work the same as Fabricate.build" 


    it "bang should be the same as Fabricate" 

  end

  describe "#make activerecord", depends_on: :active_record do

    it "should return a fabricated object" 


    it "should work the same as Fabricate.build" 


    it "bang should be the same as Fabricate" 


  end

  describe "#make sequel", depends_on: :sequel do
    it "should return a fabricated object" 


    it "should be the same as Fabricate.build" 


    it "bang should be the same as Fabricate" 

  end

end

