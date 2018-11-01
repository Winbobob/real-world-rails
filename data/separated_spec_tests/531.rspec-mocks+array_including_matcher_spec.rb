module RSpec
  module Mocks
    module ArgumentMatchers
      RSpec.describe ArrayIncludingMatcher do
        it "describes itself properly" 


        it "describes passed matchers" 


        context "passing" do
          it "matches the same array" 


          it "matches the same array, specified without square brackets" 


          it "matches the same array,  specified without square brackets" 


          it "matches the same array,  which includes nested arrays" 


          it "works with duplicates in expected" 


          it "works with duplicates in actual" 


          it "is composable with other matchers" 

        end

        context "failing" do
          it "fails when not all the entries in the expected are present" 


          it "fails when passed a composed matcher is pased and not satisfied" 

        end
      end
    end
  end
end

