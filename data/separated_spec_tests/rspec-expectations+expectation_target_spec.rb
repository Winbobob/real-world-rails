module RSpec
  module Expectations
    RSpec.describe ExpectationTarget do
      context 'when constructed via #expect' do
        it 'constructs a new instance targetting the given argument' 


        it 'constructs a new instance targetting the given block' 


        it 'raises an ArgumentError when given an argument and a block' 


        it 'raises a wrong number of args ArgumentError when given two args' 


        it 'raises an ArgumentError when given neither an argument nor a block' 


        it 'can be passed nil' 


        it 'passes a valid positive expectation' 


        it 'passes a valid negative expectation' 


        it 'passes a valid negative expectation with a split infinitive' 


        it 'fails an invalid positive expectation' 


        it 'fails an invalid negative expectation' 


        it 'fails an invalid negative expectation with a split infinitive' 


        it 'does not support operator matchers from #to' 


        it 'does not support operator matchers from #not_to' 

      end

      context "when passed a block" do
        it 'can be used with a block matcher' 


        context 'when passed a value matcher' do
          not_a_block_matcher_error = /You must pass an argument rather than a block to `expect` to use the provided matcher/

          it 'raises an error that directs the user to pass an arg rather than a block' 


          it 'assumes a custom matcher that does not define `supports_block_expectations?` is not a block matcher (since it is relatively rare)' 


          def new_non_dsl_matcher(&method_defs)
            Module.new do
              def self.matches?(object); end
              def self.failure_message; end
              module_eval(&method_defs)
            end
          end

          it "uses the matcher's `description` in the error message" 


          context 'when the matcher does not define `description` (since it is an optional part of the protocol)' do
            it 'uses `inspect` in the error message instead' 

          end
        end
      end
    end
  end
end


