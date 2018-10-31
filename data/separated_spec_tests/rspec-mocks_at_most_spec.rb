module RSpec
  module Mocks
    RSpec.describe "at_most" do
      before(:each) do
        @double = double
      end

      it "passes when at_most(n) is called exactly n times" 


      it "passes when at_most(n) is called less than n times" 


      it "passes when at_most(n) is never called" 


      it "passes when at_most(:once) is called once" 


      it "passes when at_most(:once) is never called" 


      it "passes when at_most(:twice) is called once" 


      it "passes when at_most(:twice) is called twice" 


      it "passes when at_most(:twice) is never called" 


      it "passes when at_most(:thrice) is called less than three times" 


      it "passes when at_most(:thrice) is called thrice" 


      it "returns the value given by a block when at_most(:once) method is called" 


      it "fails fast when at_most(n) times method is called n plus 1 times" 


      it "fails fast when at_most(:once) and is called twice" 


      it "fails fast when at_most(:twice) and is called three times" 


      it "fails fast when at_most(:thrice) and is called four times" 


      context "when called with negative expectation" do
        it "raises an error" 

      end
    end
  end
end

