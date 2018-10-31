module RSpec::Expectations
  RSpec.describe FailureAggregator, "when used via `aggregate_failures`" do
    it 'does not raise an error when no expectations fail' 


    it 'aggregates multiple failures into one exception that exposes all the failures' 


    it 'ensures the exposed failures have backtraces' 


    def common_contiguous_frame_percent(failure, aggregate)
      failure_frames = failure.backtrace.reverse
      aggregate_frames = aggregate.backtrace.reverse

      first_differing_index = failure_frames.zip(aggregate_frames).index { |f, a| f != a }
      100 * (first_differing_index / failure_frames.count.to_f)
    end

    it 'ensures the sub-failure backtraces are in a form that overlaps with the aggregated failure backtrace' 


    def notify_error_with(backtrace)
      exception = Exception.new
      exception.set_backtrace backtrace
      RSpec::Support.notify_failure(exception)
    end

    it 'does not stomp the backtrace on failures that have it' 


    it 'supports nested `aggregate_failures` blocks' 


    it 'raises a normal `ExpectationNotMetError` when only one expectation fails' 


    context "when multiple exceptions are notified with the same `:source_id`" do
      it 'keeps only the first' 

    end

    context "when an error other than an expectation failure occurs" do
      def expect_error_included_in_aggregated_failure(error)
        expect {
          aggregate_failures do
            expect(2).to be_odd
            raise error
          end
        }.to raise_error(an_object_having_attributes(
          :class => MultipleExpectationsNotMetError,
          :failures => [an_object_having_attributes(
            :message => "expected `2.odd?` to return true, got false"
          )],
          :other_errors => [error]
        ))
      end

      it "includes the error in the raised aggregated failure when an expectation failed as well" 


      it "handles direct `Exceptions` and not just `StandardError` and descendents" 


      it "allows the error to propagate as-is if there have been no expectation failures so far" 


      it "prevents later expectations from even running" 


      it 'provides an `all_exceptions` array containing failures and other errors' 

    end

    context "when an expectation failure happens in another thread" do
      # On Ruby 2.5+, the new `report_on_exception` causes the errors in the threads
      # to print warnings, which our rspec-support test harness converts into a test
      # failure since we want to enforce warnings-free code. To prevent the warning,
      # we need to disable the setting here.
      if Thread.respond_to?(:report_on_exception)
        around do |example|
          orig = Thread.report_on_exception
          Thread.report_on_exception = false
          example.run
          Thread.report_on_exception = orig
        end
      end

      it "includes the failure in the failures array if there are other failures" 


      it "propagates it as-is if there are no other failures or errors" 

    end

    describe "message formatting" do
      it "enumerates the failures with an index label and blank line in between" 


      it 'mentions how many failures there are' 


      it 'allows the user to name the `aggregate_failures` block' 


      context "when another error has occcured" do
        it 'includes it in the failure message' 

      end

      context "when the failure messages have multiple lines" do
        RSpec::Matchers.define :fail_with_multiple_lines do
          match { false }
          failure_message do |actual|
            "line 1\n#{actual}\nline 3"
          end
        end

        it "indents them appropriately so that they still line up" 


        it 'accounts for the width of the index when indenting' 

      end

      context "when the failure messages starts and ends with line breaks (as the `eq` failure message does)" do
        before do
          expect { expect(1).to eq(2) }.to fail_with(
            a_string_starting_with("\n") & ending_with("\n")
          )
        end

        it 'strips the excess line breaks so that it formats well' 

      end

      # Use a normal `expect(...).to include` expectation rather than
      # a composed matcher here. This provides better failure output
      # because `MultipleExpectationsNotMetError#message` is lazily
      # computed (rather than being computed in `initialize` and passed
      # to `super`), which causes the `inspect` output of the exception
      # to not include the message for some reason.
      def fail_including
        fail { |e| expect(e.message).to include(yield) }
      end
    end
  end
end

