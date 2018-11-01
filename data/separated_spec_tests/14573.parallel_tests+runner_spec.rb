require "spec_helper"
require "parallel_tests/gherkin/runner_behaviour"
require "parallel_tests/cucumber/runner"

describe ParallelTests::Cucumber::Runner do
  test_tests_in_groups(ParallelTests::Cucumber::Runner, ".feature")

  it_should_behave_like 'gherkin runners' do
    let(:runner_name) {'cucumber'}
    let(:runner_class){ParallelTests::Cucumber::Runner}

    describe :summarize_results do
      def call(*args)
        runner_class().summarize_results(*args)
      end

      it "collates failing scenarios" 


      it "collates flaky scenarios separately" 

    end
  end

  describe ".command_with_seed" do
    def call(part)
      ParallelTests::Cucumber::Runner.command_with_seed("cucumber#{part}", 555)
    end

    it "adds the randomized seed" 


    it "does not duplicate existing random command" 


    it "does not duplicate existing random command with seed" 

  end
end

