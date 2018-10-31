module RSpec
  module Mocks
    # This shared example group is highly unusual as it is used to test how
    # `have_received` works in two situations:
    #
    # * With rspec-mocks as a standalone library.
    # * Together with rspec-expectations.
    #
    # To simulate the former, we've had to hack things a bit. Special care must be taken:
    #
    # * Only define examples with `it`, (not `fit`, `xit`, `specify`, etc). We redefine
    #   `it` below to make it support our needs here but that definition isn't applied to
    #   the other forms.
    # * All normal expectations must use `_expect`, not `expect`. Expectations
    #   for `have_received` should use `expect`.
    RSpec.shared_examples_for Matchers::HaveReceived do
      # Make rspec-expectations' `expect` available via an alias so that when
      # this group is included below in a context that simulates rspec-expectations
      # not being loaded by using rspec-mocks' `expect` instead of rspec-expectations'
      # `expect`, we still have a way to use the expectations one for normal expectations.
      # In this group, all normal expectations should use `_expect` instead of `expect`.
      alias _expect expect

      describe "expect(...).to have_received" do
        it 'passes when the double has received the given message' 


        it 'passes when a null object has received the given message' 


        it 'fails when the double has not received the given message' 


        it "notifies failures via rspec-support's failure notification system" 


        it 'fails when a null object has not received the given message' 


        it 'fails when the method has not been previously stubbed' 


        it 'fails when the method has been mocked' 


        it "takes a curly-bracket block and yields the arguments given to the stubbed method call" 


        it "takes a do-end block and yields the arguments given to the stubbed method call" 


        it "passes if expectations against the yielded arguments pass" 


        it "fails if expectations against the yielded arguments fail" 


        it 'gives precedence to a `{ ... }` block when both forms are provided ' \
           'since that form actually binds to `receive`' do
          dbl = double(:foo => nil)
          called = []
          dbl.foo
          expect(dbl).to have_received(:foo) { called << :curly } do
            called << :do_end
          end
          _expect(called).to include(:curly)
          _expect(called).not_to include(:do_end)
        end

        it 'forwards any block passed during method invocation to the `have_received` block' 


        it 'resets expectations on class methods when mocks are reset' 


        context "with" do
          it 'passes when the given args match the args used with the message' 


          it 'fails when the given args do not match the args used with the message' 

        end

        it 'generates a useful description' 


        it 'can generate a description after mocks have been torn down (e.g. when rspec-core requests it)' 


        it 'produces an error message that matches the expected method if another method was called' 


        context "counts" do
          let(:the_dbl) { double(:expected_method => nil) }

          before do
            the_dbl.expected_method(:one)
            the_dbl.expected_method(:two)
            the_dbl.expected_method(:one)
          end

          context "when constrained by `with`" do
            it 'only considers the calls with matching args' 


            context "when the message is received without any args matching" do
              it 'includes unmatched args in the error message' 

            end

            context "when the message is received too many times" do
              it 'includes the counts of calls with matching args in the error message' 

            end

            context "when the message is received too few times" do
              it 'includes the counts of calls with matching args in the error message' 

            end

            context "when constrained with grouped arguments `with`" do
              it 'groups the "got" arguments based on the method call that included them' 


              it 'includes single arguments based on the method call that included them' 


              it 'keeps the array combinations distinguished in the group' 


              it 'does not group counts on repeated arguments for a single message' 

            end
          end

          context "exactly" do
            it 'passes when the message was received the given number of times' 


            it 'fails when the message was received more times than expected' 


            it 'fails when the message was received fewer times' 

          end

          context 'at_least' do
            it 'passes when the message was received the given number of times' 


            it 'passes when the message was received more times' 


            it 'fails when the message was received fewer times' 

          end

          context 'at_most' do
            it 'passes when the message was received the given number of times' 


            it 'passes when the message was received fewer times' 


            it 'fails when the message was received more times' 

          end

          context 'once' do
            it 'passes when the message was received once' 


            it 'fails when the message was never received' 


            it 'fails when the message was received twice' 

          end

          context 'twice' do
            it 'passes when the message was received twice' 


            it 'fails when the message was received once' 


            it 'fails when the message was received thrice' 

          end

          context 'thrice' do
            it 'passes when the message was received thrice' 


            it 'fails when the message was received less than three times' 


            it 'fails when the message was received more than three times' 

          end
        end

        context 'ordered' do
          let(:the_dbl) { double :one => 1, :two => 2, :three => 3 }

          it 'passes when the messages were received in order' 


          it 'passes with exact receive counts when received in order' 


          it 'passes with at most receive counts when received in order', :ordered_and_vague_counts_unsupported do
            the_dbl.one
            the_dbl.one
            the_dbl.two

            expect(the_dbl).to have_received(:one).at_most(3).times.ordered
            expect(the_dbl).to have_received(:one).at_most(:thrice).times.ordered
            expect(the_dbl).to have_received(:two).once.ordered
          end

          it 'passes with at least receive counts when received in order', :ordered_and_vague_counts_unsupported do
            the_dbl.one
            the_dbl.one
            the_dbl.two

            expect(the_dbl).to have_received(:one).at_least(1).times.ordered
            expect(the_dbl).to have_received(:two).once.ordered
          end

          it 'fails with exact receive counts when received out of order' 


          it "fails with at most receive counts when recieved out of order", :ordered_and_vague_counts_unsupported do
            the_dbl.one
            the_dbl.two
            the_dbl.one

            _expect {
              expect(the_dbl).to have_received(:one).at_most(2).times.ordered
              expect(the_dbl).to have_received(:two).once.ordered
            }.to raise_error(/received :two out of order/m)
          end

          it "fails with at least receive counts when recieved out of order", :ordered_and_vague_counts_unsupported do
            the_dbl.one
            the_dbl.two
            the_dbl.one

            _expect {
              expect(the_dbl).to have_received(:one).at_least(1).times.ordered
              expect(the_dbl).to have_received(:two).once.ordered
            }.to raise_error(/received :two out of order/m)
          end

          it 'fails when the messages are received out of order' 


          context "when used with `with`" do
            before do
              the_dbl.one(1)
              the_dbl.one(2)
            end

            it "passes when the order lines up" 


            it "fails when the order is not matched" 

          end

          context "when used on individually allowed messages" do
            before do
              allow(the_dbl).to receive(:foo)
              allow(the_dbl).to receive(:bar)

              the_dbl.foo
              the_dbl.bar
            end

            it 'passes when the messages were received in order' 


            it 'fails when the messages are received out of order' 

          end
        end
      end

      describe "expect(...).not_to have_received" do
        it 'passes when the double has not received the given message' 


        it 'fails when the double has received the given message' 


        it "notifies failures via rspec-support's failure notification system" 


        it 'fails when the method has not been previously stubbed' 


        context "with" do
          it 'passes when the given args do not match the args used with the message' 


          it 'fails when the given args match the args used with the message' 

        end

        %w[exactly at_least at_most times once twice].each do |constraint|
          it "does not allow #{constraint} to be used because it creates confusion" 

        end
      end

      describe "allow(...).to have_received" do
        it "fails because it's nonsensical" 

      end

      describe "allow_any_instance_of(...).to have_received" do
        it "fails because it's nonsensical" 

      end

      describe "expect_any_instance_of(...).to have_received" do
        it "fails because we dont want to support it" 

      end

      describe "expect_any_instance_of(...).not_to have_received" do
        it "fails because we dont want to support it" 

      end

      def double_with_met_expectation(method_name, *args)
        double = double_with_unmet_expectation(method_name)
        meet_expectation(double, method_name, *args)
      end

      def null_object_with_met_expectation(method_name, *args)
        meet_expectation(double.as_null_object, method_name, *args)
      end

      def meet_expectation(double, method_name, *args)
        double.send(method_name, *args)
        double
      end

      def double_with_unmet_expectation(method_name)
        double('double', method_name => true)
      end
    end

    RSpec.describe Matchers::HaveReceived, "when used in a context that has rspec-mocks and rspec-expectations available" do
      include_examples Matchers::HaveReceived do
        # Override `fail_including` for this context, since `have_received` is a normal
        # rspec-expectations matcher, the error class is different.
        def fail_including(*snippets)
          raise_error(RSpec::Expectations::ExpectationNotMetError, a_string_including(*snippets))
        end
      end
    end

    RSpec.describe Matchers::HaveReceived, "when used in a context that has only rspec-mocks available" do
      # We use a delegator here so that matchers can still be created
      # via the `RSpec::Matchers` methods. This works because we
      # instantiate `MocksScope` with the example group instance, so
      # all undefined methods (including matcher methods) forward to it.
      # However, `RSpec::Mocks::ExampleMethods` defines `expect` so instances
      # of this class use the version of `expect` defined in rspec-mocks, not
      # the one from rspec-expectations.
      class MocksScope
        include RSpec::Mocks::ExampleMethods

        def initialize(example_group)
          @example_group = example_group
        end

        def method_missing(*args, &block)
          @example_group.__send__(*args, &block)
        end
      end

      # Redefine `it` so that we can eval each example in a special scope
      # to simulate rspec-expectations not being loaded.
      def self.it(*args, &block)
        # Necessary so line-number filtering works...
        args << {} unless Hash === args.last
        args.last[:caller] = caller

        # delegate to the normal `it`...
        super(*args) do
          # ...but eval the block in a special scope that has `expect`
          # from rspec-mocks, not from rspec-expectations.
          MocksScope.new(self).instance_exec(&block)
        end
      end

      include_examples Matchers::HaveReceived
    end
  end
end

