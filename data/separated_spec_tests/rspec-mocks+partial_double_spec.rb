module RSpec
  module Mocks
    RSpec.describe "A partial double" do
      let(:object) { Object.new }

      it 'does not create an any_instance recorder when a message is allowed' 


      it "names the class in the failure message" 


      it "names the class in the failure message when expectation is on class" 


      it "does not conflict with @options in the object" 


      it 'allows `class` to be stubbed even when `any_instance` has already been used' 


      it 'allows `respond_to?` to be stubbed' 


      it "can disallow messages from being received" 


      it "can expect a message and set a return value" 


      it "can accept a hash as a message argument" 


      it "can accept an inner hash as a message argument" 


      it "can create a positive message expectation" 


      it 'allows a class and a subclass to both be stubbed' 


      it "verifies the method was called when expecting a message" 


      it "can accept the string form of a message for a positive message expectation" 


      it "can accept the string form of a message for a negative message expectation" 


      it "uses reports nil in the error message" 


      it "includes the class name in the error when mocking a class method that is called an extra time with the wrong args" 


      it "shares message expectations with clone" 


      it "clears message expectations when `dup`ed" 

    end

    RSpec.describe "Using a reopened file object as a partial mock" do
      let(:file_1) { File.open(File.join("tmp", "file_1"), "w").tap { |f| f.sync = true } }
      let(:file_2) { File.open(File.join("tmp", "file_2"), "w").tap { |f| f.sync = true } }

      def read_file(file)
        File.open(file.path, "r", &:read)
      end

      after do
        file_1.close
        file_2.close
      end

      def expect_output_warning_on_ruby_lt_2
        if RUBY_VERSION >= '2.0'
          yield
        else
          expect { yield }.to output(a_string_including(
            "RSpec could not fully restore", file_1.inspect, "write"
          )).to_stderr
        end
      end

      it "allows `write` to be stubbed and reset", :unless => Support::Ruby.jruby? do
        allow(file_1).to receive(:write)
        file_1.reopen(file_2)
        expect_output_warning_on_ruby_lt_2 { reset file_1 }

        expect {
          # Writing to a file that's been reopened to a 2nd file writes to both files.
          file_1.write("foo")
        }.to change  { read_file(file_1) }.from("").to("foo").
          and change { read_file(file_2) }.from("").to("foo")
      end
    end

    RSpec.describe "Using a partial mock on a proxy object", :if => defined?(::BasicObject) do
      let(:proxy_class) do
        Class.new(::BasicObject) do
          def initialize(target)
            @target = target
          end

          def proxied?
            true
          end

          def respond_to?(name, include_all=false)
            super || name == :proxied? || @target.respond_to?(name, include_all)
          end

          def method_missing(*a)
            @target.send(*a)
          end
        end
      end

      let(:wrapped_object) { Object.new }
      let(:proxy) { proxy_class.new(wrapped_object) }

      it 'works properly' 


      it 'does not confuse the proxy and the proxied object' 

    end

    RSpec.describe "Partially mocking an object that defines ==, after another mock has been defined" do
      before(:each) do
        double("existing mock", :foo => :foo)
      end

      let(:klass) do
        Class.new do
          attr_reader :val
          def initialize(val)
            @val = val
          end

          def ==(other)
            @val == other.val
          end
        end
      end

      it "does not raise an error when stubbing the object" 

    end

    RSpec.describe "A partial class mock that has been subclassed" do
      let(:klass)  { Class.new }
      let(:subklass) { Class.new(klass) }

      it "cleans up stubs during #reset to prevent leakage onto subclasses between examples" 


      describe "stubbing a base class class method" do
        before do
          allow(klass).to receive(:find).and_return "stubbed_value"
        end

        it "returns the value for the stub on the base class" 


        it "returns the value for the descendent class" 

      end
    end

    RSpec.describe "Method visibility when using partial mocks" do
      let(:klass) do
        Class.new do
          def public_method
            private_method
            protected_method
          end
        protected
          def protected_method; end
        private
          def private_method; end
        end
      end

      let(:object) { klass.new }

      it 'keeps public methods public' 


      it 'keeps private methods private' 


      it 'keeps protected methods protected' 

    end

    RSpec.describe 'when verify_partial_doubles configuration option is set' do
      include_context "with isolated configuration"

      let(:klass) do
        Class.new do
          def implemented
            "works"
          end

          def initialize(_a, _b)
          end

          def respond_to?(method_name, include_all=false)
            method_name.to_s == "dynamic_method" || super
          end

          def method_missing(method_name, *args)
            if respond_to?(method_name)
              method_name
            else
              super
            end
          end

        private

          def defined_private_method
            "works"
          end
        end
      end

      let(:object) { klass.new(1, 2) }

      before do
        RSpec::Mocks.configuration.verify_partial_doubles = true
      end

      it 'allows valid methods to be expected' 


      it 'allows private methods to be expected' 


      it 'can be temporarily supressed' 


      it 'can be temporarily supressed and nested' 


      specify 'temporarily supressing partial doubles does not affect normal verifying doubles' do
        without_partial_double_verification do
          expect {
            instance_double(Class.new, :fictitious_method => 'works')
          }.to raise_error RSpec::Mocks::MockExpectationError
        end
      end

      it 'runs the before_verifying_double callbacks before verifying an expectation' 


      it 'runs the before_verifying_double callbacks before verifying an allowance' 


      it 'avoids deadlocks when a proxy is accessed from within a `before_verifying_doubles` callback' 


      context "for a class" do
        let(:subclass) { Class.new(klass) }

        it "only runs the `before_verifying_doubles` callback for the class (not for superclasses)" 


        it 'can be temporarily supressed' 


      end

      it 'does not allow a non-existing method to be expected' 


      it 'does not allow a spy on unimplemented method' 


      it 'verifies arity range when matching arguments' 


      it 'allows a method defined with method_missing to be expected' 


      it 'allows valid methods to be expected on any_instance' 


      it 'allows private methods to be expected on any_instance expectation' 


      it 'runs the before_verifying_double callbacks on any_instance before verifying a double allowance' 


      it 'runs the before_verifying_double callbacks on any_instance before verifying a double' 


      it 'does not allow a non-existing method to be called on any_instance' 


      it 'does not allow missing methods to be called on any_instance' 


      it 'verifies arity range when receiving a message' 


      it 'allows the mock to raise an error with yield' 


      it 'allows stubbing and calls the stubbed implementation' 


      context "when `.new` is stubbed" do
        before do
          expect(klass.instance_method(:initialize).arity).to eq(2)
        end

        it 'uses the method signature from `#initialize` for arg verification' 


        context "on a class that has redefined `new`" do
          it "uses the method signature of the redefined `new` for arg verification" 

        end

        context "on a class that has undefined `new`" do
          it "prevents it from being stubbed" 

        end

        context "on a class with a private `new`" do
          it 'uses the method signature from `#initialize` for arg verification' 

        end

        context 'on a class that has redefined `self.method`' do
          it 'allows the stubbing of :new' 

        end
      end
    end
  end
end

