module RSpec
  module Mocks
    RSpec.describe "A method stub" do
      before(:each) do
        @class = Class.new do
          class << self
            def existing_class_method
              existing_private_class_method
            end

          private

            def existing_private_class_method
              :original_value
            end
          end

          def existing_instance_method
            existing_private_instance_method
          end

          def existing_private_instance_method
            :original_value
          end
        end
        @instance = @class.new
        @stub = Object.new
      end

      describe "using `and_return`" do
        it "returns declared value when message is received" 

      end

      it "instructs an instance to respond_to the message" 


      it "instructs a class object to respond_to the message" 


      it "ignores when expected message is received with no args" 


      it "ignores when message is received with args" 


      it "ignores when expected message is not received" 


      it "handles multiple stubbed methods" 


      it "is retained when stubbed object is `clone`d" 


      it "is cleared when stubbed object when `dup`ed" 


      context "using `with`" do
        it 'determines which value is returned' 


        it 'allows differing arities' 

      end

      context "when the stubbed method is called" do
        it "does not call any methods on the passed args, since that could mutate them", :issue => 892 do
          recorder = Class.new(defined?(::BasicObject) ? ::BasicObject : ::Object) do
            def called_methods
              @called_methods ||= []
            end

            def method_missing(name, *)
              called_methods << name
              self
            end
          end.new

          allow(@stub).to receive(:foo)
          expect {
            @stub.foo(recorder)
          }.not_to change(recorder, :called_methods)
        end
      end

      context "stubbing with prepend", :if => Support::RubyFeatures.module_prepends_supported? do
        module ToBePrepended
          def value
            "#{super}_prepended".to_sym
          end
        end

        it "handles stubbing prepended methods" 


        it "handles stubbing prepended methods on a class's singleton class" 


        it "handles stubbing prepended methods on an object's singleton class" 


        it 'does not unnecessarily prepend a module when the prepended module does not override the stubbed method' 


        it 'does not unnecessarily prepend a module when stubbing a method on a module extended onto itself' 


        it 'does not unnecessarily prepend a module when the module was included' 


        it 'reuses our prepend module so as not to keep mutating the ancestors' 


        context "when multiple modules are prepended, only one of which overrides the stubbed method" do
          it "can still be stubbed and reset" 

        end

        context "when a module with a method override is prepended after reset" do
          it "can still be stubbed again" 

        end
      end

      describe "#rspec_reset" do
        it "removes stubbed methods that didn't exist" 


        it "restores existing instance methods" 


        it "restores existing singleton methods with the appropriate context" 


        it "restores existing private instance methods" 


        it "restores existing class methods" 


        it "restores existing aliased module_function methods" 


        it "restores existing private class methods" 


        it "does not remove existing methods that have been stubbed twice" 


        it "correctly restores the visibility of methods whose visibility has been tweaked on the singleton class" 


        it "correctly handles stubbing inherited mixed in class methods" 


        if Support::RubyFeatures.module_prepends_supported?
          context "with a prepended module (ruby 2.0.0+)" do
            module ToBePrepended
              def existing_method
                "#{super}_prepended".to_sym
              end
            end

            before do
              @prepended_class = Class.new do
                prepend ToBePrepended

                def existing_method
                  :original_value
                end

                def non_prepended_method
                  :not_prepended
                end
              end
              @prepended_instance = @prepended_class.new
            end

            it "restores prepended instance methods" 


            it "restores non-prepended instance methods" 


            it "restores prepended class methods" 


            it "restores prepended object singleton methods" 

          end
        end
      end

      it "returns values in order to consecutive calls" 


      it "keeps returning last value in consecutive calls" 


      it "yields a specified object" 


      it "yields multiple times with multiple calls to and_yield" 


      it "yields a specified object and return another specified object" 


      it "throws when told to" 


      it "throws with argument when told to" 


      it "overrides a pre-existing method" 


      it "overrides a pre-existing stub" 


      it "allows a stub and an expectation" 

    end

    RSpec.describe "A method stub with args" do
      before(:each) do
        @stub = Object.new
        allow(@stub).to receive(:foo).with("bar")
      end

      it "does not complain if not called" 


      it "does not complain if called with arg" 


      it "complains if called with no arg" 


      it "complains if called with other arg", :github_issue => [123, 147] do
        expect {
          @stub.foo("other")
        }.to raise_error(/received :foo with unexpected arguments.*Please stub a default value/m)
      end

      it "does not complain if also mocked w/ different args" 


      it "complains if also mocked w/ different args AND called w/ a 3rd set of args" 


      it 'uses the correct stubbed response when responding to a mock expectation' 

    end
  end
end

