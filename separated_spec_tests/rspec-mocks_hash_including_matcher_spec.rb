module RSpec
  module Mocks
    module ArgumentMatchers
      RSpec.describe HashIncludingMatcher do

        it "describes itself properly" 


        it "describes passed matchers" 


        describe "passing" do
          it "matches the same hash" 


          it "matches a hash with extra stuff" 


          it "matches against classes inheriting from Hash" 


          describe "when matching against other matchers" do
            it "matches an int against anything()" 


            it "matches a string against anything()" 


            it 'can match against arbitrary objects that implement #===' 

          end

          describe "when passed only keys or keys mixed with key/value pairs" do
            it "matches if the key is present" 


            it "matches if more keys are present" 


            it "matches a string against a given key" 


            it "matches if passed one key and one key/value pair" 


            it "matches if passed many keys and one key/value pair" 


            it "matches if passed many keys and many key/value pairs" 

          end
        end

        describe "failing" do
          it "does not match a non-hash" 


          it "does not match a hash with a missing key" 


          it "does not match a hash with a missing key" 


          it "does not match an empty hash with a given key" 


          it "does not match a hash with a missing key when one pair is matching" 


          it "does not match a hash with an incorrect value" 


          it "does not match when values are nil but keys are different" 

        end
      end
    end
  end
end

