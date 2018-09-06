module RSpec
  module Matchers
    RSpec.describe "eql" do
      it_behaves_like "an RSpec matcher", :valid_value => 1, :invalid_value => 2 do
        let(:matcher) { eql(1) }
      end

      it "is diffable" 


      it "matches when actual.eql?(expected)" 


      it "does not match when !actual.eql?(expected)" 


      it "describes itself" 


      it "provides message, expected and actual on #failure_message" 


      it "provides message, expected and actual on #negative_failure_message" 

    end
  end
end

