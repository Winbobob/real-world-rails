module RSpec
  module Mocks
    RSpec.describe "Combining implementation instructions" do
      it 'can combine and_yield and and_return' 


      describe "combining and_yield, a block implementation and and_return" do
        def verify_combined_implementation
          dbl = double
          (yield dbl).and_yield(5).and_return(3)

          expect { |b|
            expect(dbl.foo(:arg, &b)).to eq(3)
          }.to yield_with_args(5)

          expect(@block_called).to be_truthy
        end

        it 'works when passing a block to `stub`' 


        it 'works when passing a block to `with`' 


        it 'works when passing a block to `exactly`' 


        it 'works when passing a block to `at_least`' 


        it 'works when passing a block to `at_most`' 


        it 'works when passing a block to `times`' 


        it 'works when passing a block to `once`' 


        it 'works when passing a block to `twice`' 


        it 'works when passing a block to `ordered`' 

      end

      it 'can combine and_yield and and_raise' 


      it 'can combine and_yield, a block implementation and and_raise' 


      it 'can combine and_yield and and_throw' 


      it 'can combine and_yield, a block implementation and and_throw' 


      describe "a double that already has a terminal `and_return(x)` action" do
        let(:the_dbl) { double }
        let(:stubbed_double) { allow(the_dbl).to receive(:foo) }
        before { stubbed_double.and_return(1) }

        it 'allows the terminal action to be overridden to `and_return(y)`' 


        it 'allows the terminal action to be overridden to `and_raise(y)`' 


        it 'allows the terminal action to be overridden to `and_throw(y)`' 

      end

      describe "a double that already has a terminal block action" do
        let(:the_dbl) { double }
        let(:stubbed_double) { allow(the_dbl).to receive(:foo) }

        it "allows the block action to be overridden" 

      end

      it 'warns when the inner implementation block is overridden' 


      it "does not warn about overriding the stub when `:with` is chained off the block" 


      it 'can combine and_call_original, with, and_return' 


      it 'raises an error if `and_call_original` is followed by any other instructions' 

    end
  end
end

