require 'delegate'

module AnyInstanceSpec
  class GrandparentClass
    def foo(_a)
      'bar'
    end

    def grandparent_method
      1
    end
  end

  class ParentClass < GrandparentClass
    def foo
      super(:a)
    end

    def caller_of_parent_aliased_method
      parent_aliased_method
    end

    alias parent_aliased_method grandparent_method
  end

  class ChildClass < ParentClass
  end
end

module RSpec
  module Mocks
    RSpec.describe "#any_instance" do
      class CustomErrorForAnyInstanceSpec < StandardError; end

      let(:klass) do
        Class.new do
          def existing_method; :existing_method_return_value; end
          def existing_method_with_arguments(_a, _b=nil); :existing_method_with_arguments_return_value; end
          def another_existing_method; end
        private
          def private_method; :private_method_return_value; end
        end
      end
      let(:existing_method_return_value) { :existing_method_return_value }

      context "chain" do
        it "yields the value specified" 

      end

      context "invocation order" do
        context "when stubbing" do
          it "raises an error if 'with' follows 'and_return'" 


          it "raises an error if 'with' follows 'and_raise'" 


          it "raises an error if 'with' follows 'and_yield'" 


          it "raises an error if 'with' follows 'and_throw'" 


          it "allows chaining 'and_yield'" 

        end

        context "when setting a message expectation" do
          it "raises an error if 'with' follows 'and_return'" 


          it "raises an error if 'with' follows 'and_raise'" 

        end
      end

      context "when stubbing" do
        it "does not suppress an exception when a method that doesn't exist is invoked" 


        context 'multiple methods' do
          it "allows multiple methods to be stubbed in a single invocation" 


          context "allows a chain of methods to be stubbed using #receive_message_chain" do
            example "given symbols representing the methods" do
              allow_any_instance_of(klass).to receive_message_chain(:one, :two, :three).and_return(:four)
              expect(klass.new.one.two.three).to eq(:four)
            end

            example "given a hash as the last argument uses the value as the expected return value" do
              allow_any_instance_of(klass).to receive_message_chain(:one, :two, :three => :four)
              expect(klass.new.one.two.three).to eq(:four)
            end

            example "given a string of '.' separated method names representing the chain" do
              allow_any_instance_of(klass).to receive_message_chain('one.two.three').and_return(:four)
              expect(klass.new.one.two.three).to eq(:four)
            end

            it "can constrain the return value by the argument to the last call" 


            it 'can use a chain of methods to perform an expectation' 

          end
        end

        context "behaves as 'every instance'" do
          let(:super_class) { Class.new { def foo; 'bar'; end } }
          let(:sub_class)   { Class.new(super_class) }

          it "stubs every instance in the spec" 


          it "stubs instance created before any_instance was called" 


          it 'handles freeze and duplication correctly' 


          it 'handles stubbing on super and subclasses' 


          it 'handles method restoration on subclasses' 

        end

        context "when the class has a prepended module", :if => Support::RubyFeatures.module_prepends_supported? do
          it 'allows stubbing a method that is not defined on the prepended module' 


          it 'prevents stubbing a method that is defined on the prepended module' 


          it 'allows stubbing a chain starting with a method that is not defined on the prepended module' 


          it 'prevents stubbing a chain starting with a method that is defined on the prepended module' 

        end

        context 'aliased methods' do
          it 'tracks aliased method calls' 

        end

        context "with argument matching" do
          before do
            allow_any_instance_of(klass).to receive(:foo).with(:param_one, :param_two).and_return(:result_one)
            allow_any_instance_of(klass).to receive(:foo).with(:param_three, :param_four).and_return(:result_two)
          end

          it "returns the stubbed value when arguments match" 


          it "fails the spec with an expectation error when the arguments do not match" 

        end

        context "with multiple stubs" do
          before do
            allow_any_instance_of(klass).to receive(:foo).and_return(1)
            allow_any_instance_of(klass).to receive(:bar).and_return(2)
          end

          it "stubs a method" 


          it "returns the same value for calls on different instances" 

        end

        context "with #and_return" do
          it "can stub a method that doesn't exist" 


          it "can stub a method that exists" 


          it "returns the same object for calls on different instances" 


          it "can change how instances responds in the middle of an example" 

        end

        context "with #and_yield" do
          it "yields the value specified" 

        end

        context 'with #and_call_original and competing #with' do
          let(:klass) { Struct.new(:a_method) }

          it 'can combine and_call_original, with, and_return' 

        end

        context "with #and_raise" do
          it "can stub a method that doesn't exist" 


          it "can stub a method that exists" 

        end

        context "with #and_throw" do
          it "can stub a method that doesn't exist" 


          it "can stub a method that exists" 

        end

        context "with a block" do
          it "stubs a method" 


          it "returns the same computed value for calls on different instances" 

        end

        context "when partially mocking objects" do
          let(:obj) { klass.new }

          it "resets partially mocked objects correctly" 

        end

        context "core ruby objects" do
          it "works uniformly across *everything*" 


          it "works with the non-standard constructor []" 


          it "works with the non-standard constructor {}" 


          it "works with the non-standard constructor \"\"" 


          it "works with the non-standard constructor \'\'" 


          it "works with the non-standard constructor module" 


          it "works with the non-standard constructor class" 

        end
      end

      context "unstubbing using `and_call_original`" do
        it "replaces the stubbed method with the original method" 


        it "removes all stubs with the supplied method name" 


        it "removes stubs even if they have already been invoked" 


        it "removes stubs from sub class after invokation when super class was originally stubbed" 


        it "removes any stubs set directly on an instance" 


        it "does not remove any expectations with the same method name" 


        it 'does not get confused about string vs symbol usage for the message' 

      end

      context "expect_any_instance_of(...).not_to receive" do
        it "fails if the method is called" 


        it "passes if no method is called" 


        it "passes if only a different method is called" 


        it "affects previously stubbed instances" 


        context "with constraints" do
          it "fails if the method is called with the specified parameters" 


          it "passes if the method is called with different parameters" 

        end

        context 'when used in combination with should_receive' do
          it 'passes if only the expected message is received' 

        end

        it "prevents confusing double-negative expressions involving `never`" 

      end

      context "setting a message expectation" do
        let(:foo_expectation_error_message) { 'Exactly one instance should have received the following message(s) but didn\'t: foo' }
        let(:existing_method_expectation_error_message) { 'Exactly one instance should have received the following message(s) but didn\'t: existing_method' }

        it "handles inspect accessing expected methods" 


        it "affects previously stubbed instances" 


        it "does not set the expectation on every instance" 


        it "does not modify the return value of stubs set on an instance" 


        it "does not modify the return value of stubs set on an instance of a subclass" 


        it "properly notifies any instance recorders at multiple levels of hierarchy when a directly stubbed object receives a message" 


        it "properly notifies any instance recorders when they are created after the object's mock proxy" 


        context "when the class has a prepended module", :if => Support::RubyFeatures.module_prepends_supported? do
          it 'allows mocking a method that is not defined on the prepended module' 


          it 'prevents mocking a method that is defined on the prepended module' 

        end

        context "when the class has an included module" do
          it 'allows mocking a method that is defined on the module' 

        end

        context "when an instance has been directly stubbed" do
          it "fails when a second instance to receive the message" 

        end

        context "when argument matching is used and an instance has stubbed the message" do
          it "fails on verify if the arguments do not match" 


          it "passes on verify if the arguments do match" 

        end

        context "with an expectation is set on a method which does not exist" do
          it "returns the expected value" 


          it "fails if an instance is created but no invocation occurs" 


          it "fails if no instance is created" 


          it "fails if no instance is created and there are multiple expectations" 


          it "allows expectations on instances to take priority" 


          context "behaves as 'exactly one instance'" do
            it "passes if subsequent invocations do not receive that message" 


            it "fails if the method is invoked on a second instance" 

          end

          context "normal expectations on the class object" do
            it "fail when unfulfilled" 


            it "pass when expectations are met" 

          end
        end

        context "with an expectation is set on a method that exists" do
          it "returns the expected value" 


          it "fails if an instance is created but no invocation occurs" 


          it "fails if no instance is created" 


          it "fails if no instance is created and there are multiple expectations" 


          context "after any one instance has received a message" do
            it "passes if subsequent invocations do not receive that message" 


            it "fails if the method is invoked on a second instance" 

          end
        end

        it 'works with a BasicObject subclass that mixes in Kernel', :if => defined?(BasicObject) do
          klazz = Class.new(BasicObject) do
            include ::Kernel
            def foo; end
          end

          expect_any_instance_of(klazz).to receive(:foo)
          klazz.new.foo
        end

        it 'works with a SimpleDelegator subclass', :if => (RUBY_VERSION.to_f > 1.8) do
          klazz = Class.new(SimpleDelegator) do
            def foo; end
          end

          expect_any_instance_of(klazz).to receive(:foo)
          klazz.new(Object.new).foo
        end

        context "with argument matching" do
          before do
            expect_any_instance_of(klass).to receive(:foo).with(:param_one, :param_two).and_return(:result_one)
            expect_any_instance_of(klass).to receive(:foo).with(:param_three, :param_four).and_return(:result_two)
          end

          it "returns the expected value when arguments match" 


          it "fails when the arguments match but different instances are used" 


          it "is not affected by the invocation of existing methods on other instances" 


          it "fails when arguments do not match" 

        end

        context "message count" do
          context "the 'once' constraint" do
            it "passes for one invocation" 


            it "fails when no instances are declared" 


            it "fails when an instance is declared but there are no invocations" 


            it "fails for more than one invocation" 

          end

          context "the 'twice' constraint" do
            it "passes for two invocations" 


            it "fails for more than two invocations" 

          end

          context "the 'thrice' constraint" do
            it "passes for three invocations" 


            it "fails for more than three invocations" 


            it "fails for less than three invocations" 

          end

          context "the 'exactly(n)' constraint" do
            it "passes for n invocations where n = 3" 


            it "fails for n invocations where n < 3" 


            it "fails for n invocations where n > 3" 

          end

          context "the 'at_least(n)' constraint" do
            it "passes for n invocations where n = 3" 


            it "fails for n invocations where n < 3" 


            it "passes for n invocations where n > 3" 

          end

          context "the 'at_most(n)' constraint" do
            it "passes for n invocations where n = 3" 


            it "passes for n invocations where n < 3" 


            it "fails for n invocations where n > 3" 

          end

          context "the 'never' constraint" do
            it "passes for 0 invocations" 


            it "fails on the first invocation" 


            context "when combined with other expectations" do
              it "passes when the other expectations are met" 


              it "fails when the other expectations are not met" 

            end
          end
        end
      end

      context "when resetting post-verification" do
        let(:space) { RSpec::Mocks.space }

        context "existing method" do
          before(:each) do
            RSpec::Mocks.space.any_instance_recorder_for(klass) # to force it to be tracked
          end

          context "with stubbing" do
            context "public methods" do
              before(:each) do
                allow_any_instance_of(klass).to receive(:existing_method).and_return(1)
                expect(klass.method_defined?(:__existing_method_without_any_instance__)).to be_truthy
              end

              it "restores the class to its original state after each example when no instance is created" 


              it "restores the class to its original state after each example when one instance is created" 


              it "restores the class to its original state after each example when more than one instance is created" 

            end

            context "private methods" do
              before :each do
                allow_any_instance_of(klass).to receive(:private_method).and_return(:something)

                verify_all
              end

              it "cleans up the backed up method" 


              it "restores a stubbed private method after the spec is run" 


              it "ensures that the restored method behaves as it originally did" 

            end
          end

          context "with expectations" do
            context "private methods" do
              before :each do
                expect_any_instance_of(klass).to receive(:private_method).and_return(:something)
                klass.new.private_method

                verify_all
              end

              it "cleans up the backed up method" 


              it "restores a stubbed private method after the spec is run" 


              it "ensures that the restored method behaves as it originally did" 

            end

            context "ensures that the subsequent specs do not see expectations set in previous specs" do
              context "when the instance created after the expectation is set" do
                it "first spec" 


                it "second spec" 

              end

              context "when the instance created before the expectation is set" do
                before :each do
                  @instance = klass.new
                end

                it "first spec" 


                it "second spec" 

              end
            end

            it "ensures that the next spec does not see that expectation" 

          end
        end

        context "with multiple calls to any_instance in the same example" do
          it "does not prevent the change from being rolled back" 

        end

        it "adds an instance to the current space when stubbed method is invoked" 

      end

      context "passing the receiver to the implementation block" do
        context "when configured to pass the instance" do
          include_context 'with isolated configuration'
          before(:each) do
            RSpec::Mocks.configuration.yield_receiver_to_any_instance_implementation_blocks = true
          end

          describe "an any instance stub" do
            it "passes the instance as the first arg of the implementation block" 


            it "does not pass the instance to and_call_original" 

          end

          describe "an any instance expectation" do
            it "doesn't effect with" 


            it "passes the instance as the first arg of the implementation block" 

          end
        end

        context "when configured not to pass the instance" do
          include_context 'with isolated configuration'
          before(:each) do
            RSpec::Mocks.configuration.yield_receiver_to_any_instance_implementation_blocks = false
          end

          describe "an any instance stub" do
            it "does not pass the instance to the implementation block" 


            it "does not cause with to fail when the instance is passed" 

          end
        end
      end

      context 'when used in conjunction with a `dup`' do
        it "doesn't cause an infinite loop" 


        it "doesn't bomb if the object doesn't support `dup`" 


        it "doesn't fail when dup accepts parameters" 

      end

      context "when directed at a method defined on a superclass" do
        let(:sub_klass) { Class.new(klass) }

        it "stubs the method correctly" 


        it "mocks the method correctly" 

      end

      context "when a class overrides Object#method" do
        let(:http_request_class) { Struct.new(:method, :uri) }

        it "stubs the method correctly" 


        it "mocks the method correctly" 

      end

      context "when used after the test has finished" do
        it "restores the original behavior of a stubbed method" 


       it "does not restore a stubbed method not originally implemented in the class" 
        it "restores the original behaviour, even if the expectation fails" 

      end
    end
  end
end

