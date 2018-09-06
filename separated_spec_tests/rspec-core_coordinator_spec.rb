require 'rspec/core/bisect/coordinator'
require 'support/fake_bisect_runner'
require 'support/formatter_support'

module RSpec::Core
  RSpec.describe Bisect::Coordinator, :simulate_shell_allowing_unquoted_ids do
    include FormatterSupport

    let(:config) { instance_double(Configuration, :bisect_runner_class => fake_bisect_runner) }
    let(:spec_runner) { instance_double(RSpec::Core::Runner, :configuration => config) }
    let(:fake_bisect_runner) do
      FakeBisectRunner.new(
        1.upto(8).map { |i| "#{i}.rb[1:1]" },
        %w[ 2.rb[1:1] ],
        { "5.rb[1:1]" => %w[ 1.rb[1:1] 4.rb[1:1] ] }
      )
    end

    def find_minimal_repro(output, formatter=Formatters::BisectProgressFormatter, bisect_runner = :fork)
      Bisect::Coordinator.bisect_with(spec_runner, [], formatter.new(output, bisect_runner))
    end

    it 'notifies the bisect progress formatter of progress and closes the output' 


    it 'can use the bisect debug formatter to get detailed progress' 


    context "with an order-independent failure" do
      it "detects the independent case and prints the minimal reproduction" 


      it "also indicates that the :fork runner may be at fault when that was used" 


      it "can use the debug formatter for detailed output" 

    end

    context "when the user aborst the bisect with ctrl-c" do
      let(:aborting_formatter) do
        Class.new(Formatters::BisectProgressFormatter) do
          Formatters.register self

          def bisect_round_started(notification)
            return super unless @round_count == 1

            Process.kill("INT", Process.pid)
            # Process.kill is not a synchronous call, so to ensure the output
            # below aborts at a deterministic place, we need to block here.
            # The sleep will be interrupted by the signal once the OS sends it.
            # For the most part, this is only needed on JRuby, but we saw
            # the asynchronous behavior on an MRI 2.0 travis build as well.
            sleep 5
          end
        end
      end

      it "prints the most minimal repro command it has found so far" 

    end
  end
end

