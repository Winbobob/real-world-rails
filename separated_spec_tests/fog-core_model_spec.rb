require "spec_helper"
require "securerandom"

class FogTestModel < Fog::Model
  identity  :id
end

describe Fog::Model do
  describe "#==" do
    it "is not equal if one is not a Fog::Model" 


    it "is equal if it is the same object" 


    it "is equal if it has the same non-nil identity and the same class" 


    it "is not equal if both have nil identity, but are different objects" 


    it "is not equal if it has a different identity" 

  end
end

