require 'spec_helper'
require 'rspec/support/fuzzy_matcher'

module RSpec
  module Support
    describe FuzzyMatcher, ".values_match?" do
      matcher :match_against do |actual|
        match { |expected| FuzzyMatcher.values_match?(expected, actual) }
      end

      it 'returns true when given equal values' 


      it 'returns false when given unequal values that do not provide match logic' 


      it 'can match a regex against a string' 


      it 'can match a regex against itself' 


      it 'can match a class against an instance' 


      it 'can match a class against itself' 


      it 'can match against a matcher' 


      it 'does not ask the second argument if it fuzzy matches (===)' 


      context "when given two 0-arg lambdas" do
        it 'returns true when given the same lambda' 


        it 'returns false when given different lambdas' 

      end

      context "when given an object whose implementation of `==` wrongly assumes it will only be called with objects of the same type" do
        Color = Struct.new(:r, :g, :b) do
          def ==(other)
            other.r == r && other.g == g && other.b == b
          end
        end

        before(:context) do
          expect { Color.new(0, 0, 0) == Object.new }.to raise_error(NoMethodError, /undefined method `r'/)
        end

        it 'can match against an expected value that matches anything' 


        it 'surfaces the `NoMethodError` when used as the expected value' 


        it 'can match against objects of the same type' 

      end

      context "when given an object whose implementation of `==` raises an ArgumentError" do
        it 'surfaces the error' 

      end

      it "does not match a struct against an array" 


      context "when given two arrays" do
        it 'returns true if they have equal values' 


        it 'returns false when given unequal values that do not provide match logic' 


        it 'does the fuzzy matching on the individual elements' 


        it 'returns false if they have a different number of elements' 


        it 'supports arbitrary nested arrays' 

      end

      it 'can match an array an arbitrary enumerable' 


      it 'does not match an empty hash against an empty array or vice-versa' 


      context 'when given two hashes' do
        it 'returns true when their keys and values are equal' 


        it 'returns false when given unequal values that do not provide match logic' 


        it 'does the fuzzy matching on the individual values' 


        it 'returns false if the expected hash has nil values that are not in the actual hash' 


        it 'returns false if actual hash has extra entries' 


        it 'does not fuzzy match on keys' 


        it 'supports arbitrary nested hashes' 

      end
    end
  end
end


