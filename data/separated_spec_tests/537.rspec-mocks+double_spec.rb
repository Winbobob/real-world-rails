module RSpec
  module Mocks
    RSpec.describe Double do
      before(:each) { @double = double("test double") }
      after(:each)  { reset @double }

      it "has method_missing as private" 


      it "does not respond_to? method_missing (because it's private)" 


      it "uses 'Double' in failure messages" 


      it "hides internals in its inspect representation" 


      it 'does not blow up when resetting standard object methods' 


      it 'does not get string vs symbol messages confused' 


      it "generates the correct error when an unfulfilled expectation uses an unused double as a `with` argument" 


      it 'allows string representation of methods in constructor' 


      it 'allows setter methods to be stubbed' 


      it 'allows `class` to be stubbed even when `any_instance` has already been used' 


      it 'allows `send` to be stubbed' 


      it "reports line number of expectation of unreceived message" 


      it "reports line number of expectation of unreceived message after a message expectation after similar stub" 


      it "passes when not receiving message specified as not to be received" 


      it "prevents confusing double-negative expressions involving `never`" 


      it "warns when `and_return` is called on a negative expectation" 


      it "passes when receiving message specified as not to be received with different args" 


      it "fails when receiving message specified as not to be received" 


      it "fails when receiving message specified as not to be received with args" 


      it "fails when array arguments do not match" 


      context "when specifying a message should not be received with specific args" do
        context "using `expect(...).not_to receive()`" do
          it 'passes when receiving the message with different args' 

        end

        context "using `expect(...).to receive().never`" do
          it 'passes when receiving the message with different args' 

        end
      end

      it 'does not get confused when a negative expectation is used with a string and symbol message' 


      it 'does not get confused when a positive expectation is used with a string and symbol message' 


      it "allows parameter as return value" 


      it "returns the previously stubbed value if no return value is set" 


      it "returns nil if no return value is set and there is no previously stubbed value" 


      it "raises exception if args don't match when method called" 


      describe "even when a similar expectation with different arguments exist" do
        it "raises exception if args don't match when method called, correctly reporting the offending arguments" 

      end

      it "raises exception if args don't match when method called even when the method is stubbed" 


      it "raises exception if args don't match when method called even when using null_object" 


      describe 'with a method that has a default argument' do
        it "raises an exception if the arguments don't match when the method is called, correctly reporting the offending arguments" 

      end

      it "fails if unexpected method called" 


      it "uses block for expectation if provided" 


      it "fails if expectation block fails" 


      it "is wrappable in an array" 


      it "is wrappable in an array when a null object" 


      it "responds to to_ary as a null object" 


      it "responds to to_a as a null object" 


      it "passes proc to expectation block without an argument" 


      it "passes proc to expectation block with an argument" 


      it "passes proc to stub block without an argurment" 


      it "passes proc to stub block with an argument" 


      it "fails right away when method defined as never is received" 


      it "raises RuntimeError by default" 


      it "raises RuntimeError with a message by default" 


      it "raises an exception of a given type without an error message" 


      it "raises an exception of a given type with a message" 


      it "raises a given instance of an exception" 


      class OutOfGas < StandardError
        attr_reader :amount, :units
        def initialize(amount, units)
          @amount = amount
          @units  = units
        end
      end

      it "raises a given instance of an exception with arguments other than the standard 'message'" 


      it "does not raise when told to if args dont match" 


      it "throws when told to" 


      it "ignores args on any args" 


      it "fails on no args if any args received" 


      it "fails when args are expected but none are received" 


      it "returns value from block by default" 


      it "yields 0 args to blocks that take a variable number of arguments" 


      it "yields 0 args multiple times to blocks that take a variable number of arguments" 


      it "yields one arg to blocks that take a variable number of arguments" 


      it "yields one arg 3 times consecutively to blocks that take a variable number of arguments" 


      it "yields many args to blocks that take a variable number of arguments" 


      it "yields many args 3 times consecutively to blocks that take a variable number of arguments" 


      it "yields single value" 


      it "yields single value 3 times consecutively" 


      it "yields two values" 


      it "yields two values 3 times consecutively" 


      it "fails when calling yielding method with wrong arity" 


      if kw_args_supported?
        it 'fails when calling yielding method with invalid kw args' 

      end

      it "fails when calling yielding method consecutively with wrong arity" 


      it "fails when calling yielding method without block" 


      it "is able to double send" 


      it "is able to raise from method calling yielding double" 


      it "clears expectations after verify" 


      it "restores objects to their original state on rspec_reset" 


      it "temporarily replaces a method stub on a double" 


      it "does not require a different signature to replace a method stub" 


      it "raises an error when a previously stubbed method has a negative expectation" 


      it "temporarily replaces a method stub on a non-double" 


      it "returns the stubbed value when no new value specified" 


      it "returns the stubbed value when stubbed with args and no new value specified" 


      it "does not mess with the stub's yielded values when also doubleed" 


      it "can yield multiple times when told to do so" 


      it "assigns stub return values" 


      describe "a double message receiving a block" do
        before(:each) do
          @double = double("double")
          @calls = 0
        end

        def add_call
          @calls += 1
        end

        it "supports a block passed to `receive` for `expect`" 


        it "supports a block passed to `receive` for `expect` after a similar stub" 


        it "calls the block after #once" 


        it "calls the block after #twice" 


        it "calls the block after #times" 


        it "calls the block after #ordered" 

      end

      describe 'string representation generated by #to_s' do
        it 'does not contain < because that might lead to invalid HTML in some situations' 

      end

      describe "#to_str", :unless => RUBY_VERSION == '1.9.2' do
        it "should not respond to #to_str to avoid being coerced to strings by the runtime" 

      end

      describe "double created with no name" do
        it "does not use a name in a failure message" 


        it "does respond to initially stubbed methods" 

      end

      describe "==" do
        it "sends '== self' to the comparison object" 

      end

      describe "with" do
        before { @double = double('double') }
        context "with args" do
          context "with matching args" do
            it "passes" 

          end

          context "with non-matching args" do
            it "fails" 

          end

          context "with non-matching doubles" do
            it "fails" 

          end

          context "with non-matching doubles as_null_object" do
            it "fails" 

          end
        end

        context "with a block" do
          context "with matching args" do
            it "returns the result of the block" 

          end

          context "with non-matching args" do
            it "fails" 

          end
        end
      end
    end
  end
end

