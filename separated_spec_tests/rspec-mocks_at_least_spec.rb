module RSpec
  module Mocks
    RSpec.describe "at_least" do
      before(:each) { @double = double }

      it "fails if method is never called" 


      it "fails when called less than n times" 


      it "fails when at least once method is never called" 


      it "fails when at least twice method is called once" 


      it "fails when at least twice method is never called" 


      it "fails when at least thrice method is called less than three times" 


      it "passes when at least n times method is called exactly n times" 


      it "passes when at least n times method is called n plus 1 times" 


      it "passes when at least once method is called once" 


      it "passes when at least once method is called twice" 


      it "passes when at least twice method is called three times" 


      it "passes when at least twice method is called twice" 


      it "passes when at least thrice method is called three times" 


      it "passes when at least thrice method is called four times" 


      it "returns the value given by a block when the at least once method is called" 


      context "when sent with 0" do
        it "outputs a removal message" 

      end

      it "uses a stub value if no value set" 


      it "prefers its own return value over a stub" 


      context "when called with negative expectation" do
        it "raises an error" 

      end
    end
  end
end

