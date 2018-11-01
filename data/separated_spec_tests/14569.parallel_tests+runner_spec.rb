require "spec_helper"
require "parallel_tests/test/runner"

describe ParallelTests::Test::Runner do
  test_tests_in_groups(ParallelTests::Test::Runner, '_test.rb')
  test_tests_in_groups(ParallelTests::Test::Runner, '_spec.rb')

  describe ".run_tests" do
    def call(*args)
      ParallelTests::Test::Runner.run_tests(*args)
    end

    it "allows to override runner executable via PARALLEL_TESTS_EXECUTABLE" 


    it "uses options" 


    it "returns the output" 

  end

  describe ".test_in_groups" do
    def call(*args)
      ParallelTests::Test::Runner.tests_in_groups(*args)
    end

    it "raises when passed invalid group" 


    it "uses given when passed found" 


    context "when passed no group" do
      it "sort by file size" 


      it "sorts by runtime when runtime is available" 


      it "sorts by filesize when there are no files" 


      it "sorts by filesize when runtime is too little" 

    end

    context "when passed runtime" do
      around { |test| Dir.mktmpdir { |dir| Dir.chdir(dir, &test) } }
      before do
        ["aaa", "bbb", "ccc", "ddd"].each { |f| File.write(f, f) }
        FileUtils.mkdir("tmp")
      end

      it "fails when there is no log" 


      it "fails when there is too little log" 


      it "groups a lot of missing files when allow-missing is high" 


      it "groups when there is enough log" 


      it "groups when test name contains colons" 


      it "groups when not even statistic" 


      it "groups with average for missing" 


      it "groups with unknown-runtime for missing" 


      it "groups by single_process pattern and then via size" 


      it "groups by size and adds isolated separately" 

    end
  end

  describe ".find_results" do
    def call(*args)
      ParallelTests::Test::Runner.find_results(*args)
    end

    it "finds multiple results in test output" 


    it "ignores color-codes" 


    it "splits lines with Windows line separators" 

  end

  describe ".find_tests" do
    def call(*args)
      ParallelTests::Test::Runner.send(:find_tests, *args)
    end

    it "finds test in folders with appended /" 


    it "finds test files nested in symlinked folders" 


    it "finds test files but ignores those in symlinked folders" 


    it "finds test files nested in different folders" 


    it "only finds tests in folders" 


    it "finds tests in nested folders" 


    it "does not expand paths" 


    it "finds test files in folders by pattern" 


    it "finds test files in folders using suffix and overriding built in suffix" 


    it "doesn't find bakup files with the same name as test files" 


    it "finds minispec files" 


    it "finds nothing if I pass nothing" 


    it "finds nothing if I pass nothing (empty array)" 


    it "keeps invalid files" 


    it "discards duplicates" 

  end

  describe ".summarize_results" do
    def call(*args)
      ParallelTests::Test::Runner.summarize_results(*args)
    end

    it "adds results" 


    it "adds results with braces" 


    it "adds same results with plurals" 


    it "adds non-similar results" 


    it "does not pluralize 1" 

  end

  describe ".execute_command" do
    def call(*args)
      ParallelTests::Test::Runner.execute_command(*args)
    end

    let(:new_line_char) { Gem.win_platform? ? "\r\n" : "\n" }

    def capture_output
      $stdout, $stderr = StringIO.new, StringIO.new
      yield
      [$stdout.string, $stderr.string]
    ensure
      $stdout, $stderr = STDOUT, STDERR
    end

    def run_with_file(content)
      ParallelTests.with_pid_file do
        capture_output do
          Tempfile.open("xxx") do |f|
            f.write(content)
            f.flush
            yield f.path
          end
        end
      end
    end

    it "sets process number to 2 for 1" 


    it "sets process number to '' for 0" 


    it "sets process number to 1 for 0 if requested" 


    it 'sets PARALLEL_TEST_GROUPS so child processes know that they are being run under parallel_tests' 


    it "skips reads from stdin" 


    it "waits for process to finish" 


    it "prints output while running" 


    it "works with synced stdout" 


    it "does not print to stdout with :serialize_stdout" 


    it "adds test env number to stdout with :prefix_output_with_test_env_number" 


    it "does not add test env number to stdout without :prefix_output_with_test_env_number" 


    it "returns correct exit status" 


    it "prints each stream to the correct stream" 


    it "uses a lower priority process when the nice option is used", unless: Gem.win_platform? do
      priority_cmd = "puts Process.getpriority(Process::PRIO_PROCESS, 0)"
      priority_without_nice = run_with_file(priority_cmd){ |cmd| call("ruby #{cmd}", 1, 4, {}) }.first.to_i
      priority_with_nice = run_with_file(priority_cmd){ |cmd| call("ruby #{cmd}", 1, 4, :nice => true) }.first.to_i
      expect(priority_without_nice).to be < priority_with_nice
    end

    it "returns command used" 


    describe "rspec seed" do
      it "includes seed when provided" 


      it "seed is nil when not provided" 

    end
  end

  describe ".command_with_seed" do
    def call(args)
      base = "ruby -Ilib:test test/minitest/test_minitest_unit.rb"
      result = ParallelTests::Test::Runner.command_with_seed("#{base}#{args}", 555)
      result.sub(base, '')
    end

    it "adds the randomized seed" 


    it "does not duplicate seed" 


    it "does not match strange seeds stuff" 


    it "does not match non seeds" 

  end
end

