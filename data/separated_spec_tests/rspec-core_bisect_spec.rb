RSpec::Support.require_rspec_core "formatters/bisect_progress_formatter"

module RSpec::Core
  RSpec.describe "Bisect", :slow, :simulate_shell_allowing_unquoted_ids do
    include FormatterSupport

    before do
      skip "These specs do not consistently pass or fail on AppVeyor on Ruby 2.1+"
    end if ENV['APPVEYOR'] && RUBY_VERSION.to_f > 2.0

    def bisect(cli_args, expected_status=nil)
      options = ConfigurationOptions.new(cli_args)

      expect {
        status = Invocations::Bisect.new.call(options, formatter_output, formatter_output)
        expect(status).to eq(expected_status) if expected_status
      }.to avoid_outputting.to_stdout_from_any_process.and avoid_outputting.to_stderr_from_any_process

      normalize_durations(formatter_output.string)
    end

    context "when a load-time problem occurs while running the suite" do
      it 'surfaces the stdout and stderr output to the user' 

    end

    context "when the spec ordering is inconsistent" do
      it 'stops bisecting and surfaces the problem to the user' 

    end
  end
end

