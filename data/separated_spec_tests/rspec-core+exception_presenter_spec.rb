# encoding: utf-8
require 'pathname'

module RSpec::Core
  RSpec.describe Formatters::ExceptionPresenter do
    include FormatterSupport

    let(:example) { new_example }
    let(:presenter) { Formatters::ExceptionPresenter.new(exception, example) }

    before do
      allow(example.execution_result).to receive(:exception) { exception }
      example.metadata[:absolute_file_path] = __FILE__
      allow(exception).to receive(:cause) if RSpec::Support::RubyFeatures.supports_exception_cause?
    end

    describe "#fully_formatted" do
      if RSpec::Support::OS.windows?
        let(:encoding_check) { '' }
        line_num = __LINE__ + 1
        # The failure happened here!
        it 'should check that output is not mangled'
      else
        let(:encoding_check) { ' Handles encoding too! ЙЦ' }
        line_num = __LINE__ + 1
        # The failure happened here! Handles encoding too! ЙЦ
      end
      let(:exception) { instance_double(Exception, :message => "Boom\nBam", :backtrace => [ "#{__FILE__}:#{line_num}"]) }

      it "formats the exception with all the normal details" 


      it "indents properly when given a multiple-digit failure index" 


      it "prints no identifier when no number argument is given" 


      it "allows the caller to specify additional indentation" 


      it 'aligns lines' 


      it 'allows the caller to omit the description' 


      it 'allows the failure/error line to be used as the description' 


      it 'allows a caller to specify extra details that are added to the bottom' 


      let(:the_exception) { instance_double(Exception, :cause => second_exception, :message => "Boom\nBam", :backtrace => [ "#{__FILE__}:#{line_num}"]) }

      let(:second_exception) do
        instance_double(Exception, :cause => first_exception, :message => "Second\nexception", :backtrace => ["#{__FILE__}:#{__LINE__}"])
      end

      caused_by_line_num = __LINE__ + 2
      let(:first_exception) do
        instance_double(Exception, :cause => nil, :message => "Real\nculprit", :backtrace => ["#{__FILE__}:#{__LINE__}"])
      end

      it 'includes the first exception that caused the failure', :if => RSpec::Support::RubyFeatures.supports_exception_cause? do
        the_presenter = Formatters::ExceptionPresenter.new(the_exception, example)

        expect(the_presenter.fully_formatted(1)).to eq(<<-EOS.gsub(/^ +\|/, ''))
          |
          |  1) Example
          |     Failure/Error: # The failure happened here!#{ encoding_check }
          |
          |       Boom
          |       Bam
          |     # ./spec/rspec/core/formatters/exception_presenter_spec.rb:#{line_num}
          |     # ------------------
          |     # --- Caused by: ---
          |     #   Real
          |     #   culprit
          |     #   ./spec/rspec/core/formatters/exception_presenter_spec.rb:#{caused_by_line_num}
        EOS
      end

      it 'wont produce a stack error when cause is the exception itself', :if => RSpec::Support::RubyFeatures.supports_exception_cause? do
        allow(the_exception).to receive(:cause) { the_exception }
        the_presenter = Formatters::ExceptionPresenter.new(the_exception, example)

        expect(the_presenter.fully_formatted(1)).to eq(<<-EOS.gsub(/^ +\|/, ''))
          |
          |  1) Example
          |     Failure/Error: # The failure happened here!#{ encoding_check }
          |
          |       Boom
          |       Bam
          |     # ./spec/rspec/core/formatters/exception_presenter_spec.rb:#{line_num}
          |     # ------------------
          |     # --- Caused by: ---
          |     #   Boom
          |     #   Bam
          |     #   ./spec/rspec/core/formatters/exception_presenter_spec.rb:#{line_num}
        EOS
      end

      it 'wont produce a stack error when the cause is an older exception', :if => RSpec::Support::RubyFeatures.supports_exception_cause? do
        allow(the_exception).to receive(:cause) do
          instance_double(Exception, :cause => the_exception, :message => "A loop", :backtrace => the_exception.backtrace)
        end
        the_presenter = Formatters::ExceptionPresenter.new(the_exception, example)

        expect(the_presenter.fully_formatted(1)).to eq(<<-EOS.gsub(/^ +\|/, ''))
          |
          |  1) Example
          |     Failure/Error: # The failure happened here!#{ encoding_check }
          |
          |       Boom
          |       Bam
          |     # ./spec/rspec/core/formatters/exception_presenter_spec.rb:#{line_num}
          |     # ------------------
          |     # --- Caused by: ---
          |     #   A loop
          |     #   ./spec/rspec/core/formatters/exception_presenter_spec.rb:#{line_num}
        EOS
      end

      it "adds extra failure lines from the example metadata" 


      describe 'line format' do
        let(:exception) do
          begin
            expression
          rescue RSpec::Support::AllExceptionsExceptOnesWeMustNotRescue => exception
            exception
          end
        end

        describe "syntax highlighting" do
          let(:expression) do
            expect('RSpec').to be_a(Integer)
          end

          it 'uses our syntax highlighter on the code snippet to format it nicely' 

        end

        context 'with single line expression and single line RSpec exception message' do
          let(:expression) do
            expect('RSpec').to be_a(Integer)
          end

          it 'crams them without blank line' 

        end

        context 'with multiline expression and single line RSpec exception message', :if => RSpec::Support::RubyFeatures.ripper_supported? do
          let(:expression) do
            expect('RSpec').
              to be_a(Integer)
          end

          it 'inserts a blank line between the expression and the message' 

        end

        context 'with single line expression and multiline RSpec exception message' do
          let(:expression) do
            expect('RSpec').to be_falsey
          end

          it 'inserts a blank line between the expression and the message' 

        end

        context 'with multiline expression and multiline RSpec exception message', :if => RSpec::Support::RubyFeatures.ripper_supported? do
          let(:expression) do
            expect('RSpec').
              to be_falsey
          end

          it 'inserts a blank line between the expression and the message' 

        end

        context 'with single line expression and RSpec exception message starting with linefeed (like `eq` matcher)' do
          let(:expression) do
            expect('Rspec').to eq('RSpec')
          end

          it 'does not insert a superfluous blank line' 

        end

        context 'with multiline expression and RSpec exception message starting with linefeed (like `eq` matcher)', :if => RSpec::Support::RubyFeatures.ripper_supported? do
          let(:expression) do
            expect('Rspec').
              to eq('RSpec')
          end

          it 'does not insert a superfluous blank line' 

        end

        context 'with single line expression and single line non-RSpec exception message' do
          let(:expression) do
            expect { fail 'Something is wrong!' }.to change { RSpec }
          end

          it 'inserts a blank line between the expression and the message' 

        end

        context 'with multiline expression and single line non-RSpec exception message', :if => RSpec::Support::RubyFeatures.ripper_supported? do
          let(:expression) do
            expect { fail 'Something is wrong!' }.
              to change { RSpec }
          end

          it 'inserts a blank line between the expression and the message' 

        end
      end
    end

    describe "#read_failed_lines" do
      def read_failed_lines
        presenter.send(:read_failed_lines)
      end

      context 'when the failed expression spans multiple lines', :if => RSpec::Support::RubyFeatures.ripper_supported? do
        let(:exception) do
          begin
            expect('RSpec').to be_a(String).
                           and start_with('R').
                           and end_with('z')
          rescue RSpec::Expectations::ExpectationNotMetError => exception
            exception
          end
        end

        context 'and the line count does not exceed RSpec.configuration.max_displayed_failure_line_count' do
          it 'returns all the lines' 

        end

        context 'and the line count exceeds RSpec.configuration.max_displayed_failure_line_count' do
          before do
            RSpec.configuration.max_displayed_failure_line_count = 2
          end

          it 'returns the lines without exceeding the max count' 

        end
      end

      context "when backtrace is a heterogeneous language stack trace" do
        let(:exception) do
          instance_double(Exception, :backtrace => [
            "at Object.prototypeMethod (foo:331:18)",
            "at Array.forEach (native)",
            "at a_named_javascript_function (/some/javascript/file.js:39:5)",
            "/some/line/of/ruby.rb:14"
          ])
        end

        it "is handled gracefully" 

      end

      context "when backtrace will generate a security error" do
        let(:exception) { instance_double(Exception, :backtrace => [ "#{__FILE__}:#{__LINE__}"]) }

        it "is handled gracefully" 

      end

      context "when ruby reports a bogus line number in the stack trace" do
        let(:exception) { instance_double(Exception, :backtrace => [ "#{__FILE__}:10000000"]) }

        it "reports the filename and that it was unable to find the matching line" 

      end

      context "when the stack trace is from a java exception" do
        let(:exception) { instance_double(Exception, :backtrace => [ "org.jruby.SomeJavaException(Unknown Source)"]) }

        it "reports that it was unable to infer a code location from the backtrace" 

      end

      context "when ruby reports a file that does not exist" do
        let(:file) { "#{__FILE__}/blah.rb" }
        let(:exception) { instance_double(Exception, :backtrace => [ "#{file}:1"]) }

        it "reports the filename and that it was unable to find the matching line" 

      end

      context "when the stacktrace includes relative paths (which can happen when using `rspec/autorun` and running files through `ruby`)" do
        let(:relative_file) { Pathname(__FILE__).relative_path_from(Pathname(Dir.pwd)) }
        line = __LINE__
        let(:exception) { instance_double(Exception, :backtrace => ["#{relative_file}:#{line}"]) }

        it 'still finds the backtrace line' 

      end

      context "when String alias to_int to_i" do
        before do
          String.class_exec do
            alias :to_int :to_i
          end
        end

        after do
          String.class_exec do
            undef to_int
          end
        end

        let(:exception) { instance_double(Exception, :backtrace => [ "#{__FILE__}:#{__LINE__}"]) }

        it "doesn't hang when file exists" 

      end
    end
  end

  RSpec.describe Formatters::ExceptionPresenter::Factory::CommonBacktraceTruncater do
    def truncate(parent, child)
      described_class.new(parent).with_truncated_backtrace(child)
    end

    def exception_with(backtrace)
      exception = Exception.new
      exception.set_backtrace(backtrace)
      exception
    end

    it 'returns an exception with the common part truncated' 


    it 'ignores excess lines in the top of the parent trace that the child does not have' 


    it 'does not truncate anything if the parent has excess lines at the bottom of the trace' 


    it 'does not mutate the provided exception' 


    it 'returns an exception with all the same attributes (except backtrace) as the provided one' 


    it 'handles child exceptions that have a blank array for the backtrace' 


    it 'handles child exceptions that have `nil` for the backtrace' 


    it 'handles parent exceptions that have a blank array for the backtrace' 


    it 'handles parent exceptions that have `nil` for the backtrace' 


    it 'returns the original exception object (not a dup) when there is no need to update the backtrace' 


    it 'returns the original exception object when parent and child have the same files' 

  end

  RSpec.shared_examples_for "a class satisfying the common multiple exception error interface" do
    def new_failure(*a)
      RSpec::Expectations::ExpectationNotMetError.new(*a)
    end

    def new_error(*a)
      StandardError.new(*a)
    end

    it 'allows you to keep track of failures and other errors in order' 


    it 'allows you to add exceptions of an anonymous class' 


    it 'ignores `Pending::PendingExampleFixedError` since it does not represent a real failure but rather the lack of one' 


    it 'is tagged with a common module so it is clear it has the interface for multiple exceptions' 

  end

  RSpec.describe RSpec::Expectations::ExpectationNotMetError do
    include_examples "a class satisfying the common multiple exception error interface" do
      def new_multiple_exception_error
        failure_aggregator = RSpec::Expectations::FailureAggregator.new(nil, {})
        RSpec::Expectations::MultipleExpectationsNotMetError.new(failure_aggregator)
      end
    end
  end

  RSpec.describe MultipleExceptionError do
    include_examples "a class satisfying the common multiple exception error interface" do
      def new_multiple_exception_error
        MultipleExceptionError.new
      end
    end

    it "does not let you add itself to the list of all_exceptions" 


    it 'supports the same interface as `RSpec::Expectations::MultipleExpectationsNotMetError`' 


    it 'allows you to instantiate it with an initial list of exceptions' 


    specify 'the `message` implementation provides all failure messages, but is not well formatted because we do not actually use it' do
      mee = MultipleExceptionError.new(
        new_failure("failure 1"),
        new_error("error 1")
      )

      expect(mee.message).to include("failure 1", "error 1")
    end

    it 'provides a description of the exception counts, correctly categorized as failures or exceptions' 


    it 'provides a summary of the exception counts' 


    it 'presents the same aggregation metadata that an `:aggregate_failures`-tagged example produces' 


    describe "::InterfaceTag.for" do
      def value_for(ex)
        described_class::InterfaceTag.for(ex)
      end

      context "when given an `#{described_class.name}`" do
        it 'returns the provided error' 

      end

      context "when given an `RSpec::Expectations::MultipleExpectationsNotMetError`" do
        it 'returns the provided error' 

      end

      context "when given any other exception" do
        it 'wraps it in a `RSpec::Expectations::MultipleExceptionError`' 

      end
    end
  end
end

