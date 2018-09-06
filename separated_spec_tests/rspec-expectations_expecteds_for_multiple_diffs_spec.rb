module RSpec
  module Matchers
    RSpec.describe ExpectedsForMultipleDiffs do

      before do
        stub_const("::RSpec::Matchers::ExpectedsForMultipleDiffs::DESCRIPTION_MAX_LENGTH", 30)
      end

      class FakeDiffer
        def self.diff(actual, expected)
          [actual, expected].inspect
        end
      end

      let(:differ) { FakeDiffer }

      let(:message) { "a message" }
      let(:actual) { "actual value" }

      let(:wrapped_value) { described_class.from("expected value") }

      def create_matcher(stubs)
        instance_double(BuiltIn::BaseMatcher, stubs.merge(
          :matches? => true,
          :failure_message => ""
        ))
      end

      let(:matcher_1) { create_matcher(:description => "matcher 1 description", :expected => "expected 1") }
      let(:matcher_2) { create_matcher(:description => "matcher 2 description", :expected => "expected 2") }
      let(:matcher_3) { create_matcher(:description => "matcher 3 description", :expected => "expected 3") }

      let(:long_description) { "a very very long description for my custom smart matcher, which can be used for everything" }
      let(:truncated_description) { "a very very long descriptio..." }
      let(:matcher_with_long_description) { create_matcher(:description => long_description, :expected => "expected value") }

      describe ".from" do
        it "wraps provided value in ExpectedsForMultipleDiffs" 


        it "returns original value if it was already wrapped" 

      end

      describe ".for_many_matchers" do
        let(:wrapped_value) { described_class.for_many_matchers([matcher_1, matcher_2, matcher_3]) }

        it "has a diff for all matchers with their description" 

      end

      describe "#message_with_diff" do
        it "returns just provided message if diff is empty" 


        it "returns just provided message if diff is just whitespace" 


        it "returns regular message with diff when single expected" 


        it "returns message with diff and matcher description when single expected with matcher" 


        it "returns message with diff and truncated matcher description if it is too long" 

      end
    end
  end
end

