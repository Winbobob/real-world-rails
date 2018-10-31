module RSpec
  module Mocks
    RSpec.describe "#once" do
      before(:each) do
        @double = double
      end

      it "passes when called once" 


      it "passes when called once with specified args" 


      it "passes when called once with unspecified args" 


      it "fails when called with wrong args" 


      it "fails fast when called twice" 


      it "fails when not called" 


      context "when called with the wrong number of times with the specified args and also called with different args" do
        it "mentions the wrong call count in the failure message rather than the different args" 

      end

      context "when called with negative expectation" do
        it "raises an error" 

      end
    end
  end
end

