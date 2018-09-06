require 'rspec/core/formatters/documentation_formatter'

module RSpec::Core::Formatters
  RSpec.describe DocumentationFormatter do
    include FormatterSupport

    before do
      send_notification :start, start_notification(2)
    end

    def execution_result(values)
      RSpec::Core::Example::ExecutionResult.new.tap do |er|
        values.each { |name, value| er.__send__(:"#{name}=", value) }
      end
    end

    it "numbers the failures" 


    it 'will not error if more finishes than starts are called' 


    it "represents nested group using hierarchy tree" 


    it "strips whitespace for each row" 


    # The backtrace is slightly different on JRuby/Rubinius so we skip there.
    it 'produces the expected full output', :if => RSpec::Support::Ruby.mri? do
      output = run_example_specs_with_formatter("doc")
      output.gsub!(/ +$/, '') # strip trailing whitespace

      expect(output).to eq(<<-EOS.gsub(/^\s+\|/, ''))
        |
        |pending spec with no implementation
        |  is pending (PENDING: Not yet implemented)
        |
        |pending command with block format
        |  with content that would fail
        |    is pending (PENDING: No reason given)
        |  behaves like shared
        |    is marked as pending but passes (FAILED - 1)
        |
        |passing spec
        |  passes
        |  passes with a multiple
        |     line description
        |
        |failing spec
        |  fails (FAILED - 2)
        |  fails twice (FAILED - 3)
        |
        |a failing spec with odd backtraces
        |  fails with a backtrace that has no file (FAILED - 4)
        |  fails with a backtrace containing an erb file (FAILED - 5)
        |  with a `nil` backtrace
        |    raises (FAILED - 6)
        |
        |#{expected_summary_output_for_example_specs}

      EOS
    end
  end
end

