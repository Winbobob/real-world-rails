module RSpec
  module Mocks
    RSpec.describe Matchers::Receive do
      include_context "with syntax", :expect

      describe "expectations/allowances on any instance recorders" do
        include_context "with syntax", [:expect, :should]

        it "warns about allow(Klass.any_instance).to receive..." 


        it "includes the correct call site in the allow warning" 


        it "warns about expect(Klass.any_instance).to receive..." 


        it "includes the correct call site in the expect warning" 

      end

      shared_examples "a receive matcher" do |*options|
        it 'allows the caller to configure how the subject responds' 


        it 'allows the caller to constrain the received arguments' 


        it 'allows the caller to constrain the received arguments by matcher' 


        it 'allows a `do...end` block implementation to be provided' 


        it 'allows chaining off a `do...end` block implementation to be provided' 


        it 'allows a `{ ... }` block implementation to be provided' 


        it 'gives precedence to a `{ ... }` block when both forms are provided ' \
           'since that form actually binds to `receive`' do
          wrapped.to receive(:foo) { :curly } do
            :do_end
          end

          expect(receiver.foo).to eq(:curly)
        end

        it 'does not support other matchers', :unless => options.include?(:allow_other_matchers) do
          expect {
            wrapped.to eq(3)
          }.to raise_error(UnsupportedMatcherError)
        end

        it 'does support inherited matchers', :unless => options.include?(:allow_other_matchers) do
          receive_foo = Class.new(RSpec::Mocks::Matchers::Receive).new(:foo, nil)
          wrapped.to receive_foo
          receiver.foo
        end

        it 'does not get confused by messages being passed as strings and symbols' 


        it 'allows do...end blocks to be passed to the fluent interface methods without getting a warning' 


        it 'makes { } blocks trump do...end blocks when passed to a fluent interface method' 

      end

      shared_examples "an expect syntax allowance" do |*options|
        it_behaves_like "a receive matcher", *options

        it 'does not expect the message to be received' 

      end

      shared_examples "an expect syntax negative allowance" do
        it 'is disabled since this expression is confusing' 

      end

      shared_examples "an expect syntax expectation" do |*options|
        it_behaves_like "a receive matcher", *options

        it 'sets up a message expectation that passes if the message is received' 


        it 'sets up a message expectation that fails if the message is not received' 


        it "reports the line number of expectation of unreceived message", :pending => options.include?(:does_not_report_line_num) do
          expected_error_line = __LINE__; wrapped.to receive(:foo)

          expect {
            verify_all
          }.to raise_error { |e|
            expect(e.backtrace.first).to match(/#{File.basename(__FILE__)}:#{expected_error_line}/)
          }
        end

        it "provides a useful matcher description" 

      end

      shared_examples "an expect syntax negative expectation" do
        it 'sets up a negative message expectation that passes if the message is not received' 


        it 'sets up a negative message expectation that fails if the message is received' 


        it 'supports `to_not` as an alias for `not_to`' 


        it 'allows the caller to constrain the received arguments' 


        it 'prevents confusing double-negative expressions involving `never`' 

      end

      shared_examples "resets partial mocks cleanly" do
        let(:klass)  { Struct.new(:foo) }
        let(:object) { klass.new :bar }

        it "removes the method double" 


        context "on a frozen object" do
          it "warns about being unable to remove the method double" 


          it "includes the spec location in the warning" 

        end
      end

      shared_examples "resets partial mocks of any instance cleanly" do
        let(:klass)  { Struct.new(:foo) }
        let(:object) { klass.new :bar }

        it "removes the method double" 

      end

      describe "allow(...).to receive" do
        it_behaves_like "an expect syntax allowance" do
          let(:receiver) { double }
          let(:wrapped)  { allow(receiver) }
        end
        it_behaves_like "resets partial mocks cleanly" do
          let(:target) { allow(object) }
        end

        context 'ordered with receive counts' do
          specify 'is not supported' do
            a_dbl = double
            expect_warning_with_call_site(__FILE__, __LINE__ + 1)
            allow(a_dbl).to receive(:one).ordered
          end
        end

        context 'on a class method, from a class with subclasses' do
          let(:superclass)     { Class.new { def self.foo; "foo"; end }}
          let(:subclass_redef) { Class.new(superclass) { def self.foo; ".foo."; end }}
          let(:subclass_deleg) { Class.new(superclass) { def self.foo; super.upcase; end }}
          let(:subclass_asis)  { Class.new(superclass) }

          context 'if the method is redefined in the subclass' do
            it 'does not stub the method in the subclass' 

          end

          context 'if the method is not redefined in the subclass' do
            it 'stubs the method in the subclass' 

          end

          it 'creates stub which can be called using `super` in a subclass' 


          it 'can stub the same method simultaneously in the superclass and subclasses' 

        end
      end

      describe "allow(...).not_to receive" do
        it_behaves_like "an expect syntax negative allowance" do
          let(:wrapped) { allow(double) }
        end
      end

      describe "allow_any_instance_of(...).to receive" do
        it_behaves_like "an expect syntax allowance" do
          let(:klass)    { Class.new }
          let(:wrapped)  { allow_any_instance_of(klass) }
          let(:receiver) { klass.new }
        end

        it_behaves_like "resets partial mocks of any instance cleanly" do
          let(:target) { allow_any_instance_of(klass) }
        end
      end

      describe "allow_any_instance_of(...).not_to receive" do
        it_behaves_like "an expect syntax negative allowance" do
          let(:wrapped) { allow_any_instance_of(Class.new) }
        end
      end

      describe "expect(...).to receive" do
        it_behaves_like "an expect syntax expectation", :allow_other_matchers do
          let(:receiver) { double }
          let(:wrapped)  { expect(receiver) }

          context "when a message is not received" do
            it 'sets up a message expectation that formats argument matchers correctly' 

          end

          context "when a message is received the wrong number of times" do
            it "sets up a message expectation that formats argument matchers correctly" 

          end
        end
        it_behaves_like "resets partial mocks cleanly" do
          let(:target) { expect(object) }
        end

        context "ordered with receive counts" do
          let(:dbl) { double(:one => 1, :two => 2) }

          it "passes with exact receive counts when the ordering is correct" 


          it "fails with exact receive counts when the ordering is incorrect" 


          it "passes with at least when the ordering is correct" 


          it "fails with at least when the ordering is incorrect", :ordered_and_vague_counts_unsupported do
            expect {
              expect(dbl).to receive(:one).at_least(2).times.ordered
              expect(dbl).to receive(:two).once.ordered

              dbl.one
              dbl.two
            }.to fail

            reset_all
          end

          it "passes with at most when the ordering is correct" 


          it "fails with at most when the ordering is incorrect", :ordered_and_vague_counts_unsupported do
            expect {
              expect(dbl).to receive(:one).at_most(2).times.ordered
              expect(dbl).to receive(:two).once.ordered

              dbl.one
              dbl.one
              dbl.one
              dbl.two
            }.to fail

            reset_all
          end

          it 'does not result in infinite recursion when `respond_to?` is stubbed' 

        end
      end

      describe "expect_any_instance_of(...).to receive" do
        it_behaves_like "an expect syntax expectation", :does_not_report_line_num do
          let(:klass)    { Class.new }
          let(:wrapped)  { expect_any_instance_of(klass) }
          let(:receiver) { klass.new }

          it 'sets up a message expectation that formats argument matchers correctly' 

        end
        it_behaves_like "resets partial mocks of any instance cleanly" do
          let(:target) { expect_any_instance_of(klass) }
        end
      end

      describe "expect(...).not_to receive" do
        it_behaves_like "an expect syntax negative expectation" do
          let(:receiver) { double }
          let(:wrapped)  { expect(receiver) }
        end
      end

      describe "expect_any_instance_of(...).not_to receive" do
        it_behaves_like "an expect syntax negative expectation" do
          let(:klass)    { Class.new }
          let(:wrapped)  { expect_any_instance_of(klass) }
          let(:receiver) { klass.new }
        end
      end

      it 'has a description before being matched' 


      shared_examples "using rspec-mocks in another test framework" do
        it 'can use the `expect` syntax' 


        it 'expects the method to be called when `expect` is used' 


        it 'supports `expect(...).not_to receive`' 


        it 'supports `expect(...).to_not receive`' 

      end

      context "when used in a test framework without rspec-expectations" do
        let(:framework) do
          Class.new do
            include RSpec::Mocks::ExampleMethods

            def eq(_)
              double("MyMatcher")
            end
          end
        end

        it_behaves_like "using rspec-mocks in another test framework"

        it 'cannot use `expect` with another matcher' 


        it 'can toggle the available syntax' 


        after { RSpec::Mocks.configuration.syntax = :expect }
      end

      context "when rspec-expectations is included in the test framework first" do
        before do
          # the examples here assume `expect` is define in RSpec::Matchers...
          expect(RSpec::Matchers.method_defined?(:expect)).to be_truthy
        end

        let(:framework) do
          Class.new do
            include RSpec::Matchers
            include RSpec::Mocks::ExampleMethods
          end
        end

        it_behaves_like "using rspec-mocks in another test framework"

        it 'can use `expect` with any matcher' 

      end

      context "when rspec-expectations is included in the test framework last" do
        before do
          # the examples here assume `expect` is define in RSpec::Matchers...
          expect(RSpec::Matchers.method_defined?(:expect)).to be_truthy
        end

        let(:framework) do
          Class.new do
            include RSpec::Mocks::ExampleMethods
            include RSpec::Matchers
          end
        end

        it_behaves_like "using rspec-mocks in another test framework"

        it 'can use `expect` with any matcher' 

      end
    end
  end
end

