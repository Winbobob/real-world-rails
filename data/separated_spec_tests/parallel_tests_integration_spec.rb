#encoding: utf-8

require 'spec_helper'

describe 'CLI' do
  before do
    FileUtils.remove_dir(folder, true)
  end

  after do
    FileUtils.remove_dir(folder, true)
  end

  def folder
    "/tmp/parallel_tests_tests"
  end

  def write(file, content)
    path = "#{folder}/#{file}"
    ensure_folder File.dirname(path)
    File.open(path, 'w') { |f| f.write content }
    path
  end

  def read(file)
    File.read "#{folder}/#{file}"
  end

  def bin_folder
    "#{File.expand_path(File.dirname(__FILE__))}/../bin"
  end

  def executable(options={})
    "ruby #{bin_folder}/parallel_#{options[:type] || 'test'}"
  end

  def ensure_folder(folder)
    FileUtils.mkpath(folder) unless File.exist?(folder)
  end

  def run_tests(test_folder, options={})
    ensure_folder folder
    processes = "-n #{options[:processes]||2}" unless options[:processes] == false
    command = "#{executable(options)} #{test_folder} #{processes} #{options[:add]}"
    result = ''
    Dir.chdir(folder) do
      env = options[:export] || {}
      IO.popen(env, command, err: [:child, :out]) do |io|
        yield(io) if block_given?
        result = io.read
      end
    end

    raise "FAILED #{command}\n#{result}" if $?.success? == !!options[:fail]
    result
  end

  def self.it_fails_without_any_files(type)
    it "fails without any files" 

  end

  it "runs tests in parallel" 


  it "runs tests which outputs accented characters" 


  it "respects default encoding when reading child stdout" 


  it "does not run any tests if there are none" 


  it "shows command with --verbose" 


  it "fails when tests fail" 


  it "can serialize stdout" 


  it "can show simulated output when serializing stdout" 


  it "can serialize stdout and stderr" 


  context "with given commands" do
    it "can exec given commands with ENV['TEST_ENV_NUMBER']" 


    it "can exec given command non-parallel" 


    it "can exec given command with a restricted set of groups" 


    it "can serialize stdout" 


    it "exists with success if all sub-processes returned success" 


    it "exists with failure if any sub-processes returned failure" 

  end

  it "runs through parallel_rspec" 


  it "runs through parallel_cucumber" 


  it "runs through parallel_spinach" 


  it "runs with --group-by found" 


  it "runs in parallel" 


  it "disables spring so correct database is used" 


  it "can enable spring" 


  it "runs with files that have spaces" 


  it "uses relative paths for easy copying" 


  it "can run with given files" 


  it "can run with test-options" 


  it "runs with PARALLEL_TEST_PROCESSORS processes" 


  it "filters test by given pattern and relative paths" 


  it "can wait_for_other_processes_to_finish" 


  it "can run only a single group" 


  context "RSpec" do
    it_fails_without_any_files "rspec"

    it "captures seed with random failures with --verbose" 

  end

  context "Test::Unit" do
    it "runs" 


    it "passes test options" 


    it_fails_without_any_files "test"
  end

  context "Cucumber" do
    before do
      write "features/steps/a.rb", "
        Given('I print TEST_ENV_NUMBER'){ puts \"YOUR TEST ENV IS \#{ENV['TEST_ENV_NUMBER']}!\" }
        And('I sleep a bit'){ sleep 0.5 }
        And('I pass'){ true }
        And('I fail'){ fail }
      "
    end

    it "runs tests which outputs accented characters" 


    it "passes TEST_ENV_NUMBER when running with pattern (issue #86)" 


    it "writes a runtime log" 


    it "runs each feature once when there are more processes then features (issue #89)" 


    it_fails_without_any_files "cucumber"

    it "collates failing scenarios" 


    it "groups by scenario" 


    it "groups by step" 


    it "captures seed with random failures with --verbose" 

  end

  context "Spinach" do
    before do
      write "features/steps/a.rb", <<-RUBY.strip_heredoc
        class A < Spinach::FeatureSteps
          Given 'I print TEST_ENV_NUMBER' do
            puts "YOUR TEST ENV IS \#{ENV['TEST_ENV_NUMBER']}!"
          end
          And 'I sleep a bit' do
            sleep 0.2
          end
        end
      RUBY
    end

    it "runs tests which outputs accented characters" 


    it "passes TEST_ENV_NUMBER when running with pattern (issue #86)" 


    it "writes a runtime log" 


    it "runs each feature once when there are more processes then features (issue #89)" 


    it_fails_without_any_files "spinach"
  end

  describe "graceful shutdown" do
    # Process.kill on Windows doesn't work as expected. It kills all process group instead of just one process.
    it "passes on int signal to child processes", unless: Gem.win_platform? do
      write "spec/test_spec.rb", "describe { specify { sleep 2; p 'here is ok' }; specify { p 'Should not get here'} }"
      pid = nil
      Thread.new { sleep 1; Process.kill("INT", pid) }
      result = run_tests("spec", processes: 2, type: 'rspec', fail: true) { |io| pid = io.pid }

      expect(result).to include("here is ok")
      expect(result).to include("RSpec is shutting down")
      expect(result).to_not include("Should not get here")
    end

    # Process.kill on Windows doesn't work as expected. It kills all process group instead of just one process.
    it "exits immediately if another int signal is received", unless: Gem.win_platform? do
      write "spec/test_spec.rb", "describe { specify { sleep 2; p 'Should not get here'} }"
      pid = nil
      Thread.new { sleep 1; Process.kill("INT", pid) }
      Thread.new { sleep 1.2; Process.kill("INT", pid) }
      result = run_tests("spec", processes: 2, type: 'rspec', fail: false) { |io| pid = io.pid }
      expect(result).to_not include("Should not get here")
    end
  end
end

