require 'support/aruba_support'
require 'rspec/core/bisect/shell_command'
require 'rspec/core/bisect/shell_runner'
require 'rspec/core/bisect/fork_runner'

module RSpec::Core
  RSpec.shared_examples_for "a bisect runner" do
    include_context "aruba support"
    before { clean_current_dir }

    let(:shell_command) { Bisect::ShellCommand.new([]) }

    def with_runner(&block)
      handle_current_dir_change do
        in_current_dir do
          options = ConfigurationOptions.new(shell_command.original_cli_args)
          runner = Runner.new(options)
          output = StringIO.new
          runner.configure(output, output)
          described_class.start(shell_command, runner, &block)
        end
      end
    end

    it 'runs the specs in an isolated environment and reports the results' 


    it 'honors `run_all_when_everything_filtered`' 


    it 'raises BisectFailedError with all run output when it encounters an error loading spec files' 

  end

  RSpec.describe Bisect::ShellRunner, :slow do
    include_examples 'a bisect runner'
  end

  RSpec.describe Bisect::ForkRunner, :if => RSpec::Support::RubyFeatures.fork_supported? do
    include_examples 'a bisect runner'

    context 'when a `--require` option has been provided' do
      let(:shell_command) { Bisect::ShellCommand.new(['--require', './spec/a_spec_helper']) }

      it 'loads the specified file only once (rather than once per subset run)' 

    end
  end
end

