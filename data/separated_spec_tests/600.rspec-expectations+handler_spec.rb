module ExampleExpectations

  class ArbitraryMatcher
    def initialize(*args, &block)
      if args.last.is_a? Hash
        @expected = args.last[:expected]
      end
      @expected = block.call if block
      @block = block
    end

    def matches?(target)
      @target = target
      return @expected == target
    end

    def with(new_value)
      @expected = new_value
      self
    end

    def failure_message
      "expected #{@expected}, got #{@target}"
    end

    def failure_message_when_negated
      "expected not #{@expected}, got #{@target}"
    end
  end

  class PositiveOnlyMatcher < ArbitraryMatcher
    undef failure_message_when_negated rescue nil
  end

  def arbitrary_matcher(*args, &block)
    ArbitraryMatcher.new(*args, &block)
  end

  def positive_only_matcher(*args, &block)
    PositiveOnlyMatcher.new(*args, &block)
  end

end

module RSpec
  module Expectations
    RSpec.describe PositiveExpectationHandler do
      include ExampleExpectations

      it "handles submitted args" 


      it "handles the submitted block" 


      describe "#handle_matcher" do
        it "asks the matcher if it matches" 


        it "returns the match value" 


        it "calls failure_message if the matcher implements it" 


        it "calls fail if matcher.diffable?" 


        it "calls failure_message if the matcher does not implement failure_message" 


        it "uses the custom failure message when one is provided" 


        it "uses the custom failure message when one is provided as a callable object" 

      end
    end

    RSpec.describe NegativeExpectationHandler do
      describe "#handle_matcher" do
        context "when the matcher responds to `does_not_match?`" do
          it "returns true when `does_not_match?` returns true" 


          it "raises an expectation failure when `does_not_match?` returns false" 

        end

        context "when the matcher does not respond to `does_not_match?`" do
          it "returns true when `matches?` returns false" 


          it "raises an expectation failure when `matches?` returns true" 

        end

        it "calls fail if matcher.diffable?" 


        it "uses the custom failure message when one is provided" 


        it "uses the custom failure message when one is provided as a callable object" 

      end
    end
  end
end

