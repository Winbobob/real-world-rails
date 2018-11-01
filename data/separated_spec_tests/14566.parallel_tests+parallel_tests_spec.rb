require "spec_helper"

describe ParallelTests do
  describe ".determine_number_of_processes" do
    before do
      allow(Parallel).to receive(:processor_count).and_return 20
    end

    def call(count)
      ParallelTests.determine_number_of_processes(count)
    end

    it "uses the given count if set" 


    it "uses the processor count from Parallel" 


    it "uses the processor count from ENV before Parallel" 


    it "does not use blank count" 


    it "does not use blank env" 

  end

  describe ".bundler_enabled?" do
    before do
      allow(Object).to receive(:const_defined?).with(:Bundler).and_return false
    end

    it "is false" 


    it "is true when there is a constant called Bundler" 


    it "is true when there is a Gemfile" 


    it "is true when there is a Gemfile in the parent directory" 

  end

  describe ".wait_for_other_processes_to_finish" do
    around do |example|
      ParallelTests.with_pid_file do
        example.run
      end
    end
    
    def with_running_processes(count, wait=0.2)
      count.times { |x| ParallelTests.pids.add(x) }
      sleep 0.1
      yield
    ensure
      sleep wait # make sure the threads have finished
    end

    it "does not wait if not run in parallel" 


    it "stops if only itself is running" 


    it "waits for other processes to finish" 

  end

  describe ".number_of_running_processes" do
    around do |example|
      ParallelTests.with_pid_file do
        example.run
      end
    end
    
    it "is 0 for nothing" 


    it "is 2 when 2 are running" 

  end

  describe ".first_process?" do
    it "is first if no env is set" 


    it "is first if env is set to blank" 


    it "is first if env is set to 1" 


    it "is not first if env is set to something else" 

  end

  describe ".last_process?" do
    it "is last if no envs are set" 


    it "is last if envs are set to blank" 


    it "is last if TEST_ENV_NUMBER is set to PARALLEL_TEST_GROUPS" 


    it "is not last if TEST_ENV_NUMBER is set to else" 

  end

  describe ".stop_all_processes" do
    # Process.kill on Windows doesn't work as expected. It kills all process group instead of just one process.
    it 'kills the running child process', unless: Gem.win_platform? do
      ParallelTests.with_pid_file do
        Thread.new do
          ParallelTests::Test::Runner.execute_command('sleep 3', 1, 1, {})
        end
        sleep(0.2)
        expect(ParallelTests.pids.count).to eq(1)
        ParallelTests.stop_all_processes
        sleep(0.2)
        expect(ParallelTests.pids.count).to eq(0)
      end
    end
  end

  it "has a version" 

end

