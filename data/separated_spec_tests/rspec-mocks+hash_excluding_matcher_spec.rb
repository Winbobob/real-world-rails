module RSpec
  module Mocks
    module ArgumentMatchers
      RSpec.describe HashExcludingMatcher do

        it "describes itself properly" 


        describe "passing" do
          it "matches a hash without the specified key" 


          it "matches a hash with the specified key, but different value" 


          it "matches a hash without the specified key, given as anything()" 


          it "matches an empty hash" 


          it "matches a hash without any of the specified keys" 


          it "matches against classes inheriting from Hash" 

        end

        describe "failing" do
          it "does not match a non-hash" 


          it "does not match a hash with a specified key" 


          it "does not match a hash with the specified key/value pair" 


          it "does not match a hash with the specified key" 


          it "does not match a hash with one of the specified keys" 


          it "does not match a hash with some of the specified keys" 


          it "does not match a hash with one key/value pair included" 

        end
      end
    end
  end
end

