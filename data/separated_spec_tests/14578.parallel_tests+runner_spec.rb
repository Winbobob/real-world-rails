require "spec_helper"
require "parallel_tests/rspec/runner"

describe ParallelTests::RSpec::Runner do
  test_tests_in_groups(ParallelTests::RSpec::Runner, '_spec.rb')

  describe '.run_tests' do
    before do
      allow(File).to receive(:file?).with('spec/spec.opts').and_return false
      allow(File).to receive(:file?).with('spec/parallel_spec.opts').and_return false
      allow(File).to receive(:file?).with('.rspec_parallel').and_return false
      allow(ParallelTests).to receive(:bundler_enabled?).and_return false
    end

    def call(*args)
      ParallelTests::RSpec::Runner.run_tests(*args)
    end

    it "runs command using nice when specifed" 


    it "runs with color when called from cmdline" 


    it "runs without color when not called from cmdline" 


    it "uses bin/rspec when present" 


    it "uses no -O when no opts where found" 


    it "uses -O spec/parallel_spec.opts with rspec2" 


    it "uses options passed in" 


    it "returns the output" 

  end

  describe '.find_results' do
    def call(*args)
      ParallelTests::RSpec::Runner.find_results(*args)
    end

    it "finds multiple results in spec output" 


    it "does not mistakenly count 'pending' failures as real failures" 

  end

  describe ".find_tests" do
    def call(*args)
      ParallelTests::RSpec::Runner.send(:find_tests, *args)
    end

    it "doesn't find bakup files with the same name as test files" 

  end

  describe ".command_with_seed" do
    def call(args)
      base = "ruby -Ilib:test test/minitest/test_minitest_unit.rb"
      result = ParallelTests::RSpec::Runner.command_with_seed("#{base}#{args}", 555)
      result.sub(base, '')
    end

    it "adds the randomized seed" 


    it "does not duplicate seed" 


    it "does not match strange seeds stuff" 


    it "does not match non seeds" 


    it "does not duplicate random" 


    it "does not duplicate rand" 


    it "does not duplicate rand with seed" 


    it "does not duplicate random with seed" 

  end
end

