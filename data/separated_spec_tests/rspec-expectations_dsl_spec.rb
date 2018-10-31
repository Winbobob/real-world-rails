# encoding: utf-8

RSpec.describe "a matcher defined using the matcher DSL" do
  def question?
    :answer
  end

  def ok
    "ok"
  end

  it "supports calling custom matchers from within other custom matchers" 


  it "has access to methods available in the scope of the example" 


  it "raises when method is missing from local scope as well as matcher" 


  it "clears user instance variables between invocations" 



  describe '#block_arg' do
    before(:context) do
      RSpec::Matchers.define :be_lazily_equal_to do
        match { actual == block_arg.call }

        description do
          "be lazily equal to #{block_arg.call}"
        end
      end
    end

    it "it is used in a passing condition" 


    it "it is used in a failing condition" 

  end

  it "warns when passing block to the block of define", :if => (RUBY_VERSION.to_f > 1.8) do
    expect(RSpec).to receive(:warning).with(/be_warning.*a_block.*block_arg/)

    RSpec::Matchers.define :be_warning do |&a_block|
      match { a_block }
    end
  end

  describe "#respond_to?" do
    it "returns true for methods in example scope" 


    it "returns false for methods not defined in matcher or example scope" 

  end
end

class UnexpectedError < StandardError; end
module MatcherHelperModule
  def self.included(base)
    base.module_exec do
      def included_method; end
    end
  end

  def self.extended(base)
    base.instance_exec do
      def extended_method; end
    end
  end

  def greeting
    "Hello, World"
  end
end

module RSpec::Matchers::DSL
  RSpec.describe "#alias_matcher" do
    describe "an alias matcher defined in the current scope" do
      alias_matcher :be_untrue_in_this_scope, :be_falsy

      it "is available only in the current scope" 

    end

    describe "an aliased matcher defined in another scope" do
      it "is not available in the current scope" 

    end
  end

  RSpec.describe "#define_negated_matcher" do
    describe "a negated matcher defined in the current scope" do
      define_negated_matcher :be_untrue_in_this_scope, :be_truthy

      it "is available only in the current scope" 

    end

    describe "a negated matcher defined in another scope" do
      it "is not available in the current scope" 

    end
  end

  RSpec.describe Matcher do
    def new_matcher(name, *expected, &block)
      RSpec::Matchers::DSL::Matcher.new(name, block, self, *expected)
    end

    it_behaves_like "an RSpec matcher", :valid_value => 1, :invalid_value => 2 do
      let(:matcher) do
        new_matcher(:equal_to_1) do
          match { |v| v == 1 }
        end
      end
    end

    it "can be stored aside and used later" 


    context 'using deprecated APIs' do
      before { allow_deprecation }

      describe "failure_message_for_should" do
        let(:matcher) do
          new_matcher(:foo) do
            match { false }
            failure_message_for_should { "failed" }
          end
        end
        line = __LINE__ - 3

        it 'defines the failure message for a positive expectation' 


        it 'prints a deprecation warning' 

      end

      describe "failure_message_for_should_not" do
        let(:matcher) do
          new_matcher(:foo) do
            match { true }
            failure_message_for_should_not { "failed" }
          end
        end
        line = __LINE__ - 3

        it 'defines the failure message for a negative expectation' 


        it 'prints a deprecation warning' 

      end

      describe "match_for_should" do
        let(:matcher) do
          new_matcher(:foo) do
            match_for_should { |arg| arg }
          end
        end
        line = __LINE__ - 3

        it 'defines the positive expectation match logic' 


        it 'prints a deprecation warning' 

      end

      describe "match_for_should_not" do
        let(:matcher) do
          new_matcher(:foo) do
            match_for_should_not { |arg| !arg }
          end
        end
        line = __LINE__ - 3

        it 'defines the positive expectation match logic' 


        it 'prints a deprecation warning' 

      end
    end

    context "with an included module" do
      let(:matcher) do
        new_matcher(:be_a_greeting) do
          include MatcherHelperModule
          match { |actual| actual == greeting }
        end
      end

      it "has access to the module's methods" 


      it "runs the module's included hook" 


      it "does not run the module's extended hook" 


      it 'allows multiple modules to be included at once' 

    end

    context "without overrides" do
      let(:matcher) do
        new_matcher(:be_a_multiple_of, 3) do |multiple|
          match do |actual|
            actual % multiple == 0
          end
        end
      end

      it "provides a default description" 


      it "provides a default positive expectation failure message" 


      it "provides a default negative expectation failure message" 

    end

    context "without overrides with chained matchers" do
      let(:matcher) do
        new_matcher(:be_bigger_than, 5) do |five|
          match do |to_match|
            (to_match > five) && smaller_than_ceiling?(to_match) && divisible_by_divisor?(to_match)
          end

          match_when_negated do |to_match|
            (to_match <= five) || greater_than_ceiling(to_match) && not_divisible_by_divisor?(to_match)
          end

          chain :and_smaller_than do |ceiling|
            @ceiling = ceiling
          end

          chain :and_divisible_by do |divisor|
            @divisor = divisor
          end

        private

          def smaller_than_ceiling?(to_match)
            to_match < @ceiling
          end

          def greater_than_ceiling(to_match)
            to_match >= @ceiling
          end

          def divisible_by_divisor?(to_match)
            @divisor % to_match == 0
          end

          def not_divisible_by_divisor?(to_match)
            @divisor % to_match != 0
          end
        end
      end

      context "when the matchers are chained" do
        include_context "isolate include_chain_clauses_in_custom_matcher_descriptions"

        context "without include_chain_clauses_in_custom_matcher_descriptions configured" do
          before { RSpec::Expectations.configuration.include_chain_clauses_in_custom_matcher_descriptions = false }
          let(:match) { matcher.and_smaller_than(10).and_divisible_by(3) }

          it "provides a default description that does not include any of the chained matchers' descriptions" 


          it "provides a default positive expectation failure message that does not include any of the chained matchers' descriptions" 


          it "provides a default negative expectation failure message that does not include the any of the chained matchers's descriptions" 

        end

        context "with include_chain_clauses_in_custom_matcher_descriptions configured to be true" do
          before do
            expect(RSpec::Expectations.configuration.include_chain_clauses_in_custom_matcher_descriptions?).to be true
          end

          it "provides a default description that includes the chained matchers' descriptions in they were used" 


          it "provides a default positive expectation failure message that includes the chained matchers' failures" 


          it "provides a default negative expectation failure message that includes the chained matchers' failures" 

        end

        it 'only decides if to include the chained clauses at the time description is invoked' 

      end
    end

    context "with separate match logic for positive and negative expectations" do
      let(:matcher) do
        new_matcher(:to_be_composed_of, 7, 11) do |a, b|
          match do |actual|
            actual == a * b
          end

          match_when_negated do |actual|
            actual == a + b
          end
        end
      end

      it "invokes the match block for #matches?" 


      it "invokes the match_when_negated block for #does_not_match?" 


      it "provides a default failure message for negative expectations" 


      it 'can access helper methods from `match_when_negated`' 

    end

    it "allows helper methods to be defined with #define_method to have access to matcher parameters" 


    it "is not diffable by default" 


    it "is diffable when told to be" 


    it 'handles multiline string diffs' 


    it 'does not confuse the diffability of different matchers' 


    it "provides expected" 


    it "provides expected when there is more than one argument" 


    it "provides expected_as_array which returns an array regardless of expected" 


    it "provides actual when `match` is used" 


    it "provides actual when the `match` block accepts splat args" 


    it 'allows an early `return` to be used from a `match` block' 


    it 'provides actual when `match_unless_raises` is used' 


    it 'allows an early `return` to be used from a `match_unless_raises` block' 


    it 'provides actual when `match_when_negated` is used' 


    it 'allows an early `return` to be used from a `match_when_negated` block' 


    context "wrapping another expectation in a `match` block" do
      context "with a positive expectation" do
        let(:matcher) do
          new_matcher(:name, "value") do |expected|
            match do |actual|
              expect(actual).to eq expected
            end
          end
        end

        specify "`match?` returns true if the wrapped expectation passes" do
          expect(self.matcher.matches?('value')).to be_truthy
        end

        specify "`match?` returns false if the wrapped expectation fails" do
          expect(self.matcher.matches?('other value')).to be_falsey
        end
      end

      context "with a negative expectation" do
        let(:matcher) do
          new_matcher(:name, "purposely_the_same") do |expected|
            match do |actual|
              expect(actual).not_to eq expected
            end
          end
        end

        specify "`match?` returns true if the wrapped expectation passes" do
          expect(self.matcher.matches?('purposely_different')).to be_truthy
        end

        specify "`match?` returns false if the wrapped expectation fails" do
          expect(self.matcher.matches?('purposely_the_same')).to be_falsey
        end
      end

      it "can use the `include` matcher from a `match` block" 


      it "can use the `match` matcher from a `match` block" 


      context "when used within an `aggregate_failures` block" do
        it 'does not aggregate the inner expectation failure' 


        it 'does not aggregate the inner expectation failure (negation)' 


        it 'still raises the expectation failure internally in case the matcher relies upon rescuing the error' 

      end
    end

    context "wrapping another expectation in a `match_when_negated` block" do
      context "with a positive expectation" do
        let(:matcher) do
          new_matcher(:name, "purposely_the_same") do |expected|
            match_when_negated do |actual|
              expect(actual).to eq expected
            end
          end
        end

        specify "`does_not_match?` returns true if the wrapped expectation passes" do
          expect(self.matcher.does_not_match?('purposely_the_same')).to be_truthy
        end

        specify "`does_not_match?` returns false if the wrapped expectation fails" do
          expect(self.matcher.does_not_match?('purposely_different')).to be_falsey
        end
      end

      context "with a negative expectation" do
        let(:matcher) do
          new_matcher(:name, "value") do |expected|
            match_when_negated do |actual|
              expect(actual).not_to eq expected
            end
          end
        end

        specify "`does_not_match?` returns true if the wrapped expectation passes" do
          expect(self.matcher.does_not_match?('other value')).to be_truthy
        end

        specify "`does_not_match?` returns false if the wrapped expectation fails" do
          expect(self.matcher.does_not_match?('value')).to be_falsey
        end
      end
    end

    context "with overrides" do
      let(:matcher) do
        new_matcher(:be_boolean, true) do |boolean|
          match do |actual|
            actual
          end
          description do |actual|
            "be the boolean #{boolean} (actual was #{actual})"
          end
          failure_message do |actual|
            "expected #{actual} to be the boolean #{boolean}"
          end
          failure_message_when_negated do |actual|
            "expected #{actual} not to be the boolean #{boolean}"
          end
        end
      end

      it "does not hide result of match block when true" 


      it "does not hide result of match block when false" 


      it "overrides the description (which yields `actual`)" 


      it "overrides the failure message for positive expectations" 


      it "overrides the failure message for negative expectations" 


      it 'can access helper methods from `description`' 


      it 'can access helper methods from `failure_message`' 


      it 'can access helper methods from `failure_message_when_negated`' 


      it 'can exit early with a `return` from `description` just like in a method' 


      it 'can exit early with a `return` from `failure_message` just like in a method' 


      it 'can exit early with a `return` from `failure_message_when_negated` just like in a method' 

    end

    context "with description override and chained matcher" do
      context "by default" do
        let(:matcher) do
          new_matcher(:be_even) do
            match do |to_match|
              (to_match % 2 == 0) && (to_match % @divisible_by == 0)
            end

            chain :and_divisible_by do |divisible_by|
              @divisible_by = divisible_by
            end

            description { super() + " and divisible by #{@divisible_by}" }
          end
        end

        context "with include_chain_clauses_in_custom_matcher_descriptions configured to false" do
          include_context "isolate include_chain_clauses_in_custom_matcher_descriptions"
          before { RSpec::Expectations.configuration.include_chain_clauses_in_custom_matcher_descriptions = false }

          it "provides a default description that does not include any of the chained matchers' descriptions" 

        end

        context "with include_chain_clauses_in_custom_matcher_descriptions configured to true" do
          it "provides a default description that does includes the chained matchers' descriptions" 

        end
      end
    end

    context "matching blocks" do
      it 'cannot match blocks by default' 


      it 'can match blocks if it declares `supports_block_expectations`' 


      it 'will not swallow expectation errors from blocks when told to' 

    end

    context "#new" do
      it "passes matches? arg to match block" 


      it "exposes arg submitted through #new to matcher block" 

    end

    context "with no args" do
      let(:matcher) do
        new_matcher(:matcher_name) do
          match do |actual|
            actual == 5
          end
        end
      end

      it "matches" 


      it "describes" 

    end

    context "with 1 arg" do
      let(:matcher) do
        new_matcher(:matcher_name, 1) do |expected|
          match do |actual|
            actual == 5 && expected == 1
          end
        end
      end

      it "matches" 


      it "describes" 

    end

    context "with multiple args" do
      let(:matcher) do
        new_matcher(:matcher_name, 1, 2, 3, 4) do |a, b, c, d|
          match do |sum|
            a + b + c + d == sum
          end
        end
      end

      it "matches" 


      it "describes" 

    end

    it "supports helper methods" 


    it "supports fluent interface" 


    it "treats method missing normally for undeclared methods" 


    it "has access to other matchers" 


    context 'when multiple instances of the same matcher are used in the same example' do
      RSpec::Matchers.define(:be_like_a) do |expected|
        match { |actual| actual == expected }
        description { "be like a #{expected}" }
        failure_message { "expected to be like a #{expected}" }
        failure_message_when_negated { "expected not to be like a #{expected}" }
      end

      # Note: these bugs were only exposed when creating both instances
      # first, then checking their descriptions/failure messages.
      #
      # That's why we eager-instantiate them here.
      let!(:moose) { be_like_a("moose") }
      let!(:horse) { be_like_a("horse") }

      it 'allows them to use the expected value in the description' 


      it 'allows them to use the expected value in the positive failure message' 


      it 'allows them to use the expected value in the negative failure message' 


      it 'allows them to match separately' 

    end

    describe "#match_unless_raises" do
      context "with an assertion" do
        mod = Module.new do
          def assert_equal(a,b)
            raise UnexpectedError.new("#{b} does not equal #{a}") unless a == b
          end
        end

        let(:matcher) do
          new_matcher(:equal, 4) do |expected|
            include mod
            match_unless_raises UnexpectedError do
              assert_equal expected, self.actual
            end
          end
        end

        context "with passing assertion" do
          it "passes" 

        end

        context "with failing assertion" do
          it "fails" 


          it "provides the raised exception" 

        end
      end

      context "with an unexpected error" do
        it "raises the error" 

      end

      context "without a specified error class" do
        let(:matcher) do
          new_matcher(:foo) do
            match_unless_raises do |actual|
              raise Exception unless actual == 5
            end
          end
        end

        it 'passes if no error is raised' 


        it 'fails if an exception is raised' 

      end

    end

    it "can define chainable methods" 


    it "can define chainable setters" 


    it "can define chainable setters for several attributes" 


    it "raises when neither a `chain` block nor attribute name is provided" 


    it "raises when both a `chain` block and attribute name are provided" 


    it 'can use an early return from a `chain` block' 


    it 'allows chainable methods to accept blocks' 


    it "prevents name collisions on chainable methods from different matchers" 


    context "defined using the dsl" do
      def a_method_in_the_example
        "method defined in the example"
      end

      it "can access methods in the running example" do |example|
        RSpec::Matchers.define(:__access_running_example) do
          match do |actual|
            a_method_in_the_example == "method defined in the example"
          end
        end
        expect(example).to __access_running_example
      end

      it 'can get a method object for methods in the running example', :if => (RUBY_VERSION.to_f > 1.8) do
        matcher = new_matcher(:get_method_object) { }
        method  = matcher.method(:a_method_in_the_example)
        expect(method.call).to eq("method defined in the example")
      end

      it 'indicates that it responds to a method from the running example' 


      it "raises NoMethodError for methods not in the running_example" do |example|
        RSpec::Matchers.define(:__raise_no_method_error) do
          match do |actual|
            self.a_method_not_in_the_example == "method defined in the example"
          end
        end

        expected_msg = "RSpec::Matchers::DSL::Matcher"
        expected_msg = "#{expected_msg} __raise_no_method_error" unless rbx?

        expect {
          expect(example).to __raise_no_method_error
        }.to raise_error(NoMethodError, /#{expected_msg}/)
      end

      def rbx?
        defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
      end
    end

  end
end

