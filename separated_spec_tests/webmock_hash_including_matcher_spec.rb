require 'spec_helper'

module WebMock
  module Matchers

    describe HashIncludingMatcher do

      it "stringifies the given hash keys" 


      it "sorts elements in the hash" 


      it "describes itself properly" 


      describe "success" do
        it "matches the same hash" 


        it "matches a hash with extra stuff" 


        describe "when matching anythingized keys" do
          let(:anything) { WebMock::Matchers::AnyArgMatcher.new(nil) }

          it "matches an int against anything()" 


          it "matches a string against anything()" 


          it "matches if the key is present" 


          it "matches if more keys are present" 


          it "matches if passed many keys and many key/value pairs" 

        end

        describe "when matching an empty hash" do
          it "matches against any hash" 

        end
      end

      describe "failing" do
        it "does not match a non-hash" 


        it "does not match a hash with a missing key" 


        it "does not match an empty hash with a given key" 


        it "does not match a hash with a missing key when one pair is matching" 


        it "does not match a hash with an incorrect value" 


        it "does not match when values are nil but keys are different" 

      end
    end
  end
end

