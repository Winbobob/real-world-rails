require "spec_helper"
require "parallel_tests/cli"
require "parallel_tests/rspec/runner"

describe ParallelTests::CLI do
  subject { ParallelTests::CLI.new }

  describe "#parse_options" do
    let(:defaults){ {:files => ["test"]} }

    def call(*args)
      subject.send(:parse_options!, *args)
    end

    it "fails without file" 


    it "parses execute" 


    it "parses regular count" 


    it "parses count 0 as non-parallel" 


    it "parses non-parallel as non-parallel" 


    it "finds the correct type when multiple are given" 


    it "parses nice as nice" 


    it "parses --verbose" 


    it "parses --quiet" 


    it "fails if both --verbose and --quiet are present" 


    it "parses --suffix" 


    it "parses --first-is-1" 


    context "parse only-group" do
      it "group_by should be set to filesize" 


      it "allows runtime" 


      it "raise error when group_by isn't filesize" 


      it "with multiple groups" 


      it "with a single group" 

    end

    context "when the -- option separator is used" do
      it "interprets arguments as files/directories" 


      it "corectly handles arguments with spaces" 


      context "when the -o options has also been given" do
        it "merges the options together" 

      end

      context "when a second -- option separator is used" do
        it "interprets the first set as test_options" 


        context "when existing test_options have previously been given" do
          it "appends the new options" 

          it "corectly handles argument values with spaces" 

        end
      end
    end
  end

  describe "#load_runner" do
    it "requires and loads default runner" 


    it "requires and loads rspec runner" 


    it "requires and loads runner with underscores" 


    it "fails to load unfindable runner" 

  end

  describe ".report_failure_rerun_commmand" do
    it "prints nothing if there are no failures" 


    shared_examples :not_verbose_rerun do |options|
      it 'prints nothing about rerun commands' 

    end

    describe "failure" do
      context 'with empty options hash' do
        include_examples :not_verbose_rerun, {}
      end

      context 'with option !verbose' do
        include_examples :not_verbose_rerun, {verbose: false}
      end

      context 'with option verbose' do
        it "prints a message and the command if there is a failure" 


        it "prints multiple commands if there are multiple failures" 


        it "only includes failures" 


        it "prints the command with the seed added by the runner" 

      end
    end
  end

  describe "#final_fail_message" do
    before do
      subject.instance_variable_set(:@runner, ParallelTests::Test::Runner)
    end

    it 'returns a plain fail message if colors are nor supported' 


    it 'returns a colorized fail message if colors are supported' 

  end

  describe "#run_tests_in_parallel" do
    context "specific groups to run" do
      let(:results){ {:stdout => "", :exit_status => 0} }
      let(:common_options) {
        { files: ["test"], group_by: :filesize, first_is_1: false }
      }
      before do
        allow(subject).to receive(:puts)
        expect(subject).to receive(:load_runner).with("my_test_runner").and_return(ParallelTests::MyTestRunner::Runner)
        allow(ParallelTests::MyTestRunner::Runner).to receive(:test_file_name).and_return("test")
        expect(ParallelTests::MyTestRunner::Runner).to receive(:tests_in_groups).and_return([
          ['aaa','bbb'],
          ['ccc', 'ddd'],
          ['eee', 'fff']
        ])
        expect(subject).to receive(:report_results).and_return(nil)
      end

      it "calls run_tests once when one group specified" 


      it "calls run_tests twice when two groups are specified" 


      it "run only one group specified" 


      it "run last group when passing a group that is not filled" 


      it "run twice with multiple groups" 

    end
  end

  describe "#display_duration" do
    def call(*args)
      subject.send(:detailed_duration, *args)
    end

    it "displays for durations near one minute" 


    it "displays for durations near one hour" 


    it "displays the correct string for miscellaneous durations" 

  end
end

module ParallelTests
  module MyTestRunner
    class Runner
    end
  end
end

