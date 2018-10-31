module RSpec
  module Matchers
    RSpec.describe AliasedMatcher do
      RSpec::Matchers.define :my_base_matcher do
        match { |actual| actual == foo }

        def foo
          13
        end

        def description
          "my base matcher description"
        end
      end
      RSpec::Matchers.alias_matcher :alias_of_my_base_matcher, :my_base_matcher

      it_behaves_like "an RSpec matcher", :valid_value => 13, :invalid_value => nil do
        let(:matcher) { alias_of_my_base_matcher }
      end

      shared_examples "making a copy" do |copy_method|
        context "when making a copy via `#{copy_method}`" do
          it "uses a copy of the base matcher" 


          it "copies custom matchers properly so they can work even though they have singleton behavior" 

        end
      end

      include_examples "making a copy", :dup
      include_examples "making a copy", :clone

      it 'can get a method object for delegated methods', :if => (RUBY_VERSION.to_f > 1.8) do
        matcher = my_base_matcher
        decorated = AliasedMatcher.new(matcher, Proc.new { })

        expect(decorated.method(:foo).call).to eq(13)
      end

      it 'can get a method object for `description`' 


      RSpec::Matchers.alias_matcher :my_overriden_matcher, :my_base_matcher do |desc|
        desc + " (overriden)"
      end

      it 'overrides the description with the provided block' 


      RSpec::Matchers.alias_matcher :my_blockless_override, :my_base_matcher

      it 'provides a default description override based on the old and new games' 


      it 'works properly with a chained method off a negated matcher' 


      context "when negating a matcher that does not define `description` (which is an optional part of the matcher protocol)" do
        def matcher_without_description
          matcher = Object.new
          def matcher.matches?(v); v; end
          def matcher.failure_message; "match failed"; end
          def matcher.chained; self; end
          expect(RSpec::Matchers.is_a_matcher?(matcher)).to be true

          matcher
        end

        RSpec::Matchers.define_negated_matcher :negation_of_matcher_without_description, :matcher_without_description

        it 'works properly' 

      end
    end
  end
end


