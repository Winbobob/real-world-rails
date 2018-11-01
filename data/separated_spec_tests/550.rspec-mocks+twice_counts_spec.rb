module RSpec
  module Mocks
    RSpec.describe "#twice" do
      before(:each) do
        @double = double("test double")
      end

      it "passes when called twice" 


      it "passes when called twice with specified args" 


      it "passes when called twice with unspecified args" 


      it "fails fast when call count is higher than expected" 


      it "fails when call count is lower than expected" 


      it "fails when called with wrong args on the first call" 


      it "fails when called with wrong args on the second call" 


      context "when called with the wrong number of times with the specified args and also called with different args" do
        it "mentions the wrong call count in the failure message rather than the different args" 

      end

      context "when called with negative expectation" do
        it "raises an error" 

      end
    end
  end
end

