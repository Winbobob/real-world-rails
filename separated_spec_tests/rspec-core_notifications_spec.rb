require 'rspec/core/notifications'

# ANSI codes aren't easy to read in failure output, so use tags instead
class TagColorizer
  def self.wrap(text, code_or_symbol)
    "<#{code_or_symbol}>#{text}</#{code_or_symbol}>"
  end
end

RSpec.describe "FailedExampleNotification" do
  include FormatterSupport

  let(:example) { new_example(:status => :failed) }
  exception_line = __LINE__ + 1
  let(:exception) { instance_double(Exception, :backtrace => [ "#{__FILE__}:#{exception_line}"], :message => 'Test exception') }
  let(:notification) { ::RSpec::Core::Notifications::ExampleNotification.for(example) }

  before do
    example.execution_result.exception = exception
    example.metadata[:absolute_file_path] = __FILE__
  end

  it 'provides a description' 


  it 'provides `colorized_formatted_backtrace`, which formats the backtrace and colorizes it' 


  describe "fully formatted failure output" do
    def fully_formatted(*args)
      notification.fully_formatted(1, *args)
    end

    def dedent(string)
      string.gsub(/^ +\|/, '')
    end

    context "when the exception is a MultipleExpectationsNotMetError" do
      RSpec::Matchers.define :fail_with_description do |desc|
        match { false }
        description { desc }
        failure_message { "expected pass, but #{desc}" }
      end

      def capture_and_normalize_aggregation_error
        yield
      rescue RSpec::Expectations::MultipleExpectationsNotMetError => failure
        normalize_backtraces(failure)
        failure
      end

      def normalize_backtraces(failure)
        failure.all_exceptions.each do |exception|
          if exception.is_a?(RSpec::Expectations::MultipleExpectationsNotMetError)
            normalize_backtraces(exception)
          end

          normalize_one_backtrace(exception)
        end

        normalize_one_backtrace(failure)
      end

      def normalize_one_backtrace(exception)
        line = exception.backtrace.find { |l| l.include?(__FILE__) }
        exception.set_backtrace([ line.sub(/:in .*$/, '') ])
      end

      let(:aggregate_line) { __LINE__ + 3 }
      let(:exception) do
        capture_and_normalize_aggregation_error do
          aggregate_failures("multiple expectations") do
            expect(1).to fail_with_description("foo")
            expect(1).to fail_with_description("bar")
          end
        end
      end

      it 'provides a summary composed of example description, failure count and aggregate backtrace' 


      it 'lists each individual expectation failure, with a backtrace relative to the aggregation block' 


      it 'uses the `failure` color in the summary output' 


      it 'uses the `failure` color for the sub-failure messages' 


      context "due to using `:aggregate_failures` metadata" do
        let(:exception) do
          ex = nil
          RSpec.describe do
            ex = it "", :aggregate_failures do
              expect(1).to fail_with_description("foo")
              expect(1).to fail_with_description("bar")
            end
          end.run

          capture_and_normalize_aggregation_error { raise ex.execution_result.exception }
        end

        it 'uses an alternate format for the exception summary to avoid confusing references to the aggregation block or stack trace' 

      end

      context "when the failure happened in a shared example group" do
        before do |ex|
          example.metadata[:shared_group_inclusion_backtrace] << RSpec::Core::SharedExampleGroupInclusionStackFrame.new(
            "Stuff", "./some_shared_group_file.rb:13"
          )
        end

        it "includes the shared group backtrace as part of the aggregate failure backtrace" 


        it "does not include the shared group backtrace in the sub-failure backtraces" 

      end

      context "when `aggregate_failures` is used in nested fashion" do
        let(:aggregate_line) { __LINE__ + 3 }
        let(:exception) do
          capture_and_normalize_aggregation_error do
            aggregate_failures("outer") do
              expect(1).to fail_with_description("foo")

              aggregate_failures("inner") do
                expect(2).to fail_with_description("bar")
                expect(3).to fail_with_description("baz")
              end

              expect(1).to fail_with_description("qux")
            end
          end
        end

        it 'recursively formats the nested aggregated failures' 

      end

      context "when there are failures and other errors" do
        let(:aggregate_line) { __LINE__ + 3 }
        let(:exception) do
          capture_and_normalize_aggregation_error do
            aggregate_failures("multiple expectations") do
              expect(1).to fail_with_description("foo")
              raise "boom"
            end
          end
        end

        it 'lists both types in the exception listing' 

      end

      context "in a pending spec" do
        before do
          example.execution_result.status = :pending
          example.execution_result.pending_message = 'Some pending reason'
          example.execution_result.pending_exception = exception
          example.execution_result.exception = nil
        end

        it 'includes both the pending message and aggregate summary' 


        it 'uses the `pending` color in the summary output' 


        it 'uses the `pending` color for the sub-failure messages' 

      end
    end

    context "when the exception is a MultipleExceptionError" do
      let(:sub_failure_1)  { StandardError.new("foo").tap { |e| e.set_backtrace([]) } }
      let(:sub_failure_2)  { StandardError.new("bar").tap { |e| e.set_backtrace([]) } }
      let(:exception)      { RSpec::Core::MultipleExceptionError.new(sub_failure_1, sub_failure_2) }

      it "lists each sub-failure, just like with MultipleExpectationsNotMetError" 

    end
  end

  describe '#message_lines' do
    let(:example_group) { class_double(RSpec::Core::ExampleGroup, :metadata => {}, :parent_groups => [], :location => "#{__FILE__}:#{__LINE__}") }

    before do
      allow(example).to receive(:example_group) { example_group }
    end

    it 'should return failure_lines without color' 


    it 'returns failures_lines without color when they are part of a shared example group' 


    if String.method_defined?(:encoding)
      it "returns failures_lines with invalid bytes replace by '?'" 

    end
  end
end

module RSpec::Core::Notifications
  RSpec.describe ExamplesNotification do
    include FormatterSupport

    describe "#notifications" do
      it 'returns an array of notification objects for all the examples' 

    end
  end
end

module RSpec::Core::Notifications
  RSpec.describe SummaryNotification do
    include FormatterSupport

    subject(:notification) do
      summary_notification(
        duration,
        examples,
        failed_examples,
        pending_examples,
        load_time,
        errors_outside_of_examples_count
      )
    end

    let(:duration) do
      1.23
    end

    let(:examples) do
      [
        new_example(:status => :passed),
        new_example(:status => :passed)
      ]
    end

    let(:failed_examples) do
      examples.select { |example| example.execution_result.status == :failed }
    end

    let(:pending_examples) do
      examples.select { |example| example.execution_result.status == :pending }
    end

    let(:load_time) do
      0.1
    end

    let(:errors_outside_of_examples_count) do
      0
    end

    describe '#fully_formatted' do
      subject(:fully_formatted) do
        notification.fully_formatted(TagColorizer)
      end

      context 'when all examples are passed' do
        let(:examples) do
          [
            new_example(:status => :passed),
            new_example(:status => :passed)
          ]
        end

        it 'turns the summary line green' 

      end

      context "when there're a pending example and no failed example" do
        let(:examples) do
          [
            new_example(:status => :passed),
            new_example(:status => :pending)
          ]
        end

        it 'turns the summary line yellow' 

      end

      context "when there're a pending example and a failed example" do
        let(:examples) do
          [
            new_example(:status => :passed),
            new_example(:status => :pending),
            new_example(:status => :failed)
          ]
        end

        it 'turns the summary line red' 

      end

      context "when there's an error outside of examples" do
        let(:errors_outside_of_examples_count) do
          1
        end

        it 'turns the summary line red' 

      end
    end
  end
end

