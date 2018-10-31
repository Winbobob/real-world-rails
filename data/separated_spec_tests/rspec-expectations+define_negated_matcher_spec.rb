module RSpec
  module Matchers
    RSpec.describe 'RSpec::Matchers.define_negated_matcher' do
      RSpec::Matchers.define :my_base_non_negated_matcher do
        match { |actual| actual == foo }

        def foo
          13
        end

        def description
          "my base matcher description"
        end
      end

      shared_examples "making a copy" do |copy_method|
        context "when making a copy via `#{copy_method}`" do
          it "uses a copy of the base matcher" 


          it "copies custom matchers properly so they can work even though they have singleton behavior" 

        end
      end

      include_examples "making a copy", :dup
      include_examples "making a copy", :clone

      RSpec::Matchers.define_negated_matcher :an_array_excluding, :include
      it_behaves_like "an RSpec matcher", :valid_value => [1, 3], :invalid_value => [1, 2] do
        let(:matcher) { an_array_excluding(2) }
      end

      it 'works properly when composed' 


      describe "the failure message" do
        context "for a matcher with default failure messages" do
          RSpec::Matchers.define(:be_awesome) { match(&:awesome?) }
          RSpec::Matchers.define_negated_matcher :be_lame, :be_awesome

          context "when failing positively" do
            it "uses the phrasing from the provided defined matcher alias" 

          end

          context "when failing negatively" do
            it "uses the phrasing from the provided defined matcher alias" 

          end

          context "when accessed via an alias that is not included in failure messages" do
            alias_method :be_fantastic, :be_awesome
            RSpec::Matchers.define_negated_matcher :be_terrible, :be_fantastic

            context "when failing positively" do
              it "uses the wrapped matcher's `failure_message_when_negated`" 

            end

            context "when failing negatively" do
              it "uses the wrapped matcher's `failure_message`" 

            end
          end
        end

        context "for a matcher with a customized `failure_message_when_negated`" do
          RSpec::Matchers.define(:be_tall) do
            match(&:tall?)
            failure_message_when_negated do |actual|
              "expected #{actual.inspect} not to be tall, but was tall"
            end
          end
          RSpec::Matchers.define_negated_matcher :be_short, :be_tall

          context "when failing positively" do
            it "uses the wrapped matcher's `failure_message_when_negated` since it may include more detail" 

          end

          context "when failing negatively" do
            it "uses the wrapped matcher's `failure_message` since it may include more detail" 

          end
        end
      end

      context 'when no block is passed' do
        RSpec::Matchers.define :be_an_odd_number do
          match { |actual| actual.odd? }
        end
        RSpec::Matchers.define_negated_matcher :be_an_even_number, :be_an_odd_number

        it 'uses the default negated description' 


        context "when matched positively" do
          it 'matches values that fail the original matcher' 


          it "fails matches against values that pass the original matcher" 

        end

        context "when matched negatively" do
          it 'matches values that fail the original matcher' 


          it "fails matches against values that pass the original matcher" 

        end
      end

      context 'when the negated description is overriden' do
        RSpec::Matchers.define :be_bigger_than_ten do
          match { |actual| actual > 10 }
        end
        RSpec::Matchers.define_negated_matcher :be_smaller_than_ten, :be_bigger_than_ten do |desc|
          "#{desc.sub('bigger', 'smaller')} (overriden)"
        end

        it 'overrides the description with the provided block' 


        it 'overrides the failure message with the provided block' 

      end

      context "for a matcher that has custom `match_when_negated` logic" do
        RSpec::Matchers.define :matcher_with_custom_negation do |match_value|
          match { match_value }
          match_when_negated { |actual| actual == :does_not_match_true }
        end
        RSpec::Matchers.define_negated_matcher :negated_matcher_with_custom_negation, :matcher_with_custom_negation

        it "uses the `match_when_negated` logic for matching" 


        it "uses the `match` logic for `expect(..).not_to`" 

      end
    end
  end
end

