require 'rspec/core/bisect/shell_command'
require 'rspec/core/bisect/shell_runner'
require 'rspec/core/bisect/utilities'

module RSpec::Core
  RSpec.describe Bisect::ShellRunner do
    let(:server) { instance_double("RSpec::Core::Bisect::Server", :drb_port => 1234) }
    let(:shell_command) { Bisect::ShellCommand.new(original_cli_args) }
    let(:runner) { described_class.new(server, shell_command) }

    describe "#run" do
      let(:original_cli_args) { %w[ spec/1_spec.rb ] }
      let(:target_specs) { %w[ spec/1_spec.rb[1:1] spec/1_spec.rb[1:2] ] }

      it "passes the failed examples from the original run as the expected failures so the runs can abort early" 

    end

    describe "#original_results" do
      let(:original_cli_args) { %w[spec/unit --seed 1234] }

      open3_method = Open3.respond_to?(:capture2e) ? :capture2e : :popen3
      open3_method = :popen3 if RSpec::Support::Ruby.jruby?

      def called_environment
        @called_environment
      end

      if open3_method == :capture2e
        RSpec::Matchers.define :invoke_command_with_env do |command, environment|
          match do |block|
            block.call

            expect(Open3).to have_received(open3_method).with(environment, command)
          end

          supports_block_expectations
        end
      elsif open3_method == :popen3
        RSpec::Matchers.define :invoke_command_with_env do |command, environment|
          match do |block|
            block.call

            expect(Open3).to have_received(open3_method).with(command)
            expect(called_environment).to include(environment)
          end

          supports_block_expectations
        end
      end

      before do
        allow(Open3).to receive(open3_method) do
          @called_environment = ENV.to_hash.dup
          [double("Exit Status"), double("Stdout/err")]
        end

        allow(server).to receive(:capture_run_results) do |&block|
          block.call
          "the results"
        end
      end

      it "runs the suite with the original CLI options" 


      context 'when --bisect is present in SPEC_OPTS' do
        it "runs the suite with --bisect removed from the environment" 

      end

      context 'when --bisect=verbose is present in SPEC_OPTS' do
        it "runs the suite with --bisect removed from the environment" 

      end

      it 'returns the run results' 


      it 'memoizes, since it is expensive to re-run the suite' 

    end

    def uses_quoting_for_escaping?
      RSpec::Support::OS.windows? || RSpec::Support::Ruby.jruby?
    end
  end
end

