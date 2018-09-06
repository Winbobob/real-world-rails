module RSpec
  module Matchers
    RSpec.describe "expect(actual).to be_within(delta).of(expected)" do
      it_behaves_like "an RSpec matcher", :valid_value => 5, :invalid_value => -5 do
        let(:matcher) { be_within(2).of(4.0) }
      end

      it "passes when actual == expected" 


      it "passes when actual < (expected + delta)" 


      it "passes when actual > (expected - delta)" 


      it "passes when actual == (expected - delta)" 


      it "passes when actual == (expected + delta)" 


      it "passes with integer arguments that are near each other" 


      it "passes with negative arguments" 


      it "fails when actual < (expected - delta)" 


      it "fails when actual > (expected + delta)" 


      it "works with Time" 


      it "provides a description" 


      it "raises an error if no expected value is given" 


      it "fails if the actual is not numeric" 

    end

    RSpec.describe "expect(actual).to be_within(delta).percent_of(expected)" do
      it "passes when actual is within the given percent variance" 


      it "fails when actual is outside the given percent variance" 


      it "provides a description" 

    end

    RSpec.describe "expect(actual).not_to be_within(delta).of(expected)" do
      it "passes when actual < (expected - delta)" 


      it "passes when actual > (expected + delta)" 


      it "fails when actual == expected" 


      it "fails when actual < (expected + delta)" 


      it "fails when actual > (expected - delta)" 


      it "fails when actual == (expected - delta)" 


      it "fails when actual == (expected + delta)" 


      it "passes if the actual is not numeric" 

    end
  end
end

