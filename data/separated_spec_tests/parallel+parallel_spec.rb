require 'spec_helper'

describe Parallel do
  worker_types = (Process.respond_to?(:fork) ? ["processes", "threads"] : ["threads"])

  def time_taken
    t = Time.now.to_f
    yield
    RUBY_ENGINE == "jruby" ? 0: Time.now.to_f - t # jruby is super slow ... don't blow up all the tests ...
  end

  def kill_process_with_name(file, signal='INT')
    running_processes = `ps -f`.split("\n").map{ |line| line.split(/\s+/) }
    pid_index = running_processes.detect { |p| p.include?("UID") }.index("UID") + 1
    parent_pid = running_processes.detect { |p| p.include?(file) and not p.include?("sh") }[pid_index]
    `kill -s #{signal} #{parent_pid}`
  end

  def execute_start_and_kill(command, amount, signal='INT')
    t = nil
    lambda {
      t = Thread.new { `ruby spec/cases/parallel_start_and_kill.rb #{command} 2>&1 && echo "FINISHED"` }
      sleep 1.5
      kill_process_with_name('spec/cases/parallel_start_and_kill.rb', signal)
      sleep 1
    }.should change { `ps`.split("\n").size }.by amount
    t.value
  end

  describe ".processor_count" do
    before do
      Parallel.instance_variable_set(:@processor_count, nil)
    end

    it "returns a number" 


    if RUBY_PLATFORM =~ /darwin10/
      it 'works if hwprefs in not available' 

    end

    if RUBY_VERSION.to_f >= 2.2
      it 'uses Etc.nprocessors in Ruby 2.2+' 

    else
      it 'doesnt use Etc.nprocessors in Ruby 2.1 and below' 

    end
  end

  describe ".physical_processor_count" do
    before do
      Parallel.instance_variable_set(:@physical_processor_count, nil)
    end

    it "returns a number" 


    it "is even factor of logical cpus" 

  end

  describe ".in_processes" do
    def cpus
      Parallel.processor_count
    end

    it "executes with detected cpus" 


    it "executes with detected cpus when nil was given" 


    it "set amount of parallel processes" 


    it "enforces only one worker type" 


    it "does not influence outside data" 


    it "kills the processes when the main process gets killed through ctrl+c" 


    it "kills the processes when the main process gets killed through a custom interrupt" 


    it "kills the threads when the main process gets killed through ctrl+c" 


    it "does not kill processes when the main process gets sent an interrupt besides the custom interrupt" 


    it "does not kill threads when the main process gets sent an interrupt besides the custom interrupt" 


    it "does not kill anything on ctrl+c when everything has finished" 


    it "preserves original intrrupts" 


    it "restores original intrrupts" 


    it "saves time" 


    it "raises when one of the processes raises" 


    it "can raise an undumpable exception" 


    it "can handle Break exceptions when the better_errors gem is installed" 


    it 'can handle to high fork rate' 


    it 'does not leave processes behind while running' 


    it "does not open unnecessary pipes" 

  end

  describe ".in_threads" do
    it "saves time" 


    it "does not create new processes" 


    it "returns results as array" 


    it "raises when a thread raises" 

  end

  describe ".map" do
    it "saves time" 


    it "executes with given parameters" 


    it "can dump/load complex objects" 


    it "starts new process imediatly when old exists" 


    it "does not flatten results" 


    it "can run in threads" 


    it 'supports all Enumerable-s' 


    it 'handles nested arrays and nil correctly' 


    worker_types.each do |type|
      it "stops all workers when one fails in #{type}" 


      it "stops all workers when one raises Break in #{type}" 


      it "stops all workers when a start hook fails with #{type}" 


      it "stops all workers when a finish hook fails with #{type}" 


      it "does not call the finish hook when a worker fails with #{type}" 


      it "does not call the finish hook when a worker raises Break in #{type}" 


      it "does not call the finish hook when a start hook fails with #{type}" 


      it "sets Parallel.worker_number with 4 #{type}" 


      it "sets Parallel.worker_number with 0 #{type}" 

    end

    it "can run with 0 threads" 


    it "can run with 0 processes" 


    it "notifies when an item of work is dispatched to a worker process" 


    it "notifies when an item of work is dispatched with 0 processes" 


    it "notifies when an item of work is completed by a worker process" 


    it "notifies when an item of work is completed with 0 processes" 


    it "notifies when an item of work is dispatched to a threaded worker" 


    it "notifies when an item of work is dispatched with 0 threads" 


    it "notifies when an item of work is completed by a threaded worker" 


    it "notifies when an item of work is completed with 0 threads" 


    it "spits out a useful error when a worker dies before read" 


    it "spits out a useful error when a worker dies before write" 


    it "raises DeadWorker when using exit so people learn to not kill workers and do not crash main process" 


    it 'raises EOF (not DeadWorker) when a worker raises EOF in process' 


    it "can be killed instantly" 


    it "synchronizes :start and :finish" 


    it 'is equivalent to serial map' 


    it 'can work in isolation' 


    it 'sets Parallel.worker_number when run with isolation' 

  end

  describe ".map_with_index" do
    it "yields object and index" 


    it "does not crash with empty set" 


    it "can run with 0 threads" 


    it "can run with 0 processes" 

  end

  describe ".any?" do
    it "returns true if any result is truthy" 


    it "returns false if all results are falsy" 

  end

  describe ".all?" do
    it "returns true if all results are truthy" 


    it "returns false if any result is falsy" 

  end

  describe ".each" do
    it "returns original array, works like map" 


    it "passes result to :finish callback :in_processes`" 


    it "passes result to :finish callback :in_threads`" 


    it "does not use marshal_dump" 


    it "does not slow down with lots of GC work in threads" 


    it "can modify in-place" 


    worker_types.each do |type|
      it "works with SQLite in #{type}" 


      it "stops all workers when one fails in #{type}" 


      it "stops all workers when one raises Break in #{type}" 


      it "stops all workers when a start hook fails with #{type}" 


      it 'stops all workers when a finish hook fails with processes' 


      it "does not call the finish hook when a worker fails with #{type}" 


      it "does not call the finish hook when a worker raises Break in #{type}" 


      it "does not call the finish hook when a start hook fails with #{type}" 


      it "sets Parallel.worker_number with #{type}" 

    end

    it "re-raises exceptions in work_direct" 


    it "handles Break in work_direct" 

  end

  describe ".each_with_index" do
    it "yields object and index" 

  end

  describe "progress" do
    it "takes the title from :progress" 


    it "takes true from :progress" 


    it "works with :finish" 


    it "takes the title from :progress[:title] and passes options along" 

  end

  ["lambda", "queue"].each do |thing|
    describe "lambdas" do
      let(:result) { "ITEM-1\nITEM-2\nITEM-3\n" }

      it "runs in threads" 


      it "runs in processs" 


      it "refuses to use progress" 

    end
  end

  it "fails when running with a prefilled queue without stop since there are no threads to fill it" 


  describe "GC" do
    def normalize(result)
      result.sub(/\{(.*)\}/, "\\1").split(", ").reject { |x| x =~ /^(Hash|Array|String)=>(1|-1|-2)$/ }
    end

    worker_types.each do |type|
      it "does not leak memory in #{type}" 

    end
  end
end

