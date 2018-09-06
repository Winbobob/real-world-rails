require 'rspec/core/bisect/example_minimizer'
require 'rspec/core/bisect/server'
require 'rspec/core/bisect/shell_command'
require 'support/fake_bisect_runner'

module RSpec::Core
  RSpec.describe Bisect::ExampleMinimizer do
    around do |ex|
      # so example ids do not have to be escaped
      with_env_vars('SHELL' => 'bash', &ex)
    end

    let(:fake_runner) do
      FakeBisectRunner.new(
        %w[ 1.rb[1] 2.rb[1] 3.rb[1] 4.rb[1] 5.rb[1] 6.rb[1] 7.rb[1] 8.rb[1] ],
        %w[ 2.rb[1] ],
        { "5.rb[1]" => %w[ 4.rb[1] ] }
      )
    end

    it 'repeatedly runs various subsets of the suite, removing examples that have no effect on the failing examples' 


    it 'reduces a failure where none of the passing examples are implicated' 


    it 'reduces a failure when more than 50% of examples are implicated' 


    it 'reduces a failure with multiple dependencies' 


    context 'with an unminimisable failure' do
      class RunCountingReporter < RSpec::Core::NullReporter
        attr_accessor :round_count
        attr_accessor :example_count
        def initialize
          @round_count = 0
        end

        def publish(event, *args)
          send(event, *args) if respond_to? event
        end

        def bisect_individual_run_start(_notification)
          self.round_count += 1
        end
      end

      let(:counting_reporter) { RunCountingReporter.new }
      let(:fake_runner) do
        FakeBisectRunner.new(
          %w[ 1.rb[1] 2.rb[1] 3.rb[1] 4.rb[1] 5.rb[1] 6.rb[1] 7.rb[1] 8.rb[1] 9.rb[1] ],
          [],
          "9.rb[1]" => %w[ 1.rb[1] 2.rb[1] 3.rb[1] 4.rb[1] 5.rb[1] 6.rb[1] 7.rb[1] 8.rb[1] ]
        )
      end
      let(:counting_minimizer) do
        new_minimizer(fake_runner, counting_reporter)
      end

      it 'returns the full command if the failure can not be reduced' 


      it 'detects an unminimisable failure in the minimum number of runs' 

    end

    it 'ignores flapping examples that did not fail on the initial full run but fail on later runs' 


    it 'aborts early when no examples fail' 


    context "when the `repro_command_for_currently_needed_ids` is queried before it has sufficient information" do
      it 'returns an explanation that will be printed when the bisect run is aborted immediately' 

    end

    def new_minimizer(runner, reporter=RSpec::Core::NullReporter)
      shell_command = Bisect::ShellCommand.new([])
      Bisect::ExampleMinimizer.new(shell_command, runner, reporter)
    end
  end
end

