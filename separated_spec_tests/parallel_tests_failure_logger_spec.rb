require 'spec_helper'
require 'parallel_tests/gherkin/io'
require 'parallel_tests/cucumber/failures_logger'

describe ParallelTests::Cucumber::FailuresLogger, skip: RUBY_VERSION < "2.2" do

  before do
    @output = OutputLogger.new([])
    allow(@output).to receive(:write)

    config = double('config', out_stream: @output, on_event: :test_run_finished)

    @logger1 = ParallelTests::Cucumber::FailuresLogger.new(config)
    @logger2 = ParallelTests::Cucumber::FailuresLogger.new(config)
    @logger3 = ParallelTests::Cucumber::FailuresLogger.new(config)

    @feature1 = double('feature', :file => "feature/path/to/feature1.feature")
    @feature2 = double('feature', :file => "feature/path/to/feature2.feature")
    @feature3 = double('feature', :file => "feature/path/to/feature3.feature")

    @logger1.instance_variable_set("@failures", { @feature1.file => [1, 2, 3] })
    @logger2.instance_variable_set("@failures", { @feature2.file => [2, 4, 6] })
    @logger3.instance_variable_set("@failures", { @feature3.file => [3, 6, 9] })
  end

  it "should produce a list of lines for failing scenarios" 

end
