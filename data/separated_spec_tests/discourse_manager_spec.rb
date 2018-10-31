# encoding: utf-8
require 'rails_helper'
require 'scheduler/scheduler'

describe Scheduler::Manager do

  module Testing
    class RandomJob
      extend ::Scheduler::Schedule

      def self.runs=(val)
        @runs = val
      end

      def self.runs
        @runs ||= 0
      end

      every 5.minutes

      def perform
        self.class.runs += 1
        sleep 0.001
      end
    end

    class SuperLongJob
      extend ::Scheduler::Schedule

      every 10.minutes

      def perform
        sleep 1000
      end
    end

    class PerHostJob
      extend ::Scheduler::Schedule

      per_host
      every 10.minutes

      def self.runs=(val)
        @runs = val
      end

      def self.runs
        @runs ||= 0
      end

      def perform
        self.class.runs += 1
      end
    end
  end

  let(:manager) {
    Scheduler::Manager.new(DiscourseRedis.new, enable_stats: false)
  }

  before do
    expect(ActiveRecord::Base.connection_pool.connections.length).to eq(1)
    @thread_count = Thread.list.count
    @thread_ids = Thread.list.map { |t| t.object_id }
  end

  after do
    manager.stop!
    manager.remove(Testing::RandomJob)
    manager.remove(Testing::SuperLongJob)
    manager.remove(Testing::PerHostJob)
    $redis.flushall

    # connections that are not in use must be removed
    # otherwise active record gets super confused
    ActiveRecord::Base.connection_pool.connections.reject { |c| c.in_use? }.each do |c|
      ActiveRecord::Base.connection_pool.remove(c)
    end
    expect(ActiveRecord::Base.connection_pool.connections.length).to (be <= 1)

    on_thread_mismatch = lambda do
      current = Thread.list.map { |t| t.object_id }

      extra = current - @thread_ids
      missing = @thread_ids - current

      if missing.length > 0
        STDERR.puts "\nMissing Threads #{missing.length} thread/s"
      end

      if extra.length > 0
        Thread.list.each do |thread|
          if extra.include?(thread.object_id)
            STDERR.puts "\nExtra Thread Backtrace:"
            STDERR.puts thread.backtrace
            STDERR.puts
          end
        end
      end
    end

    wait_for(on_fail: on_thread_mismatch) do
      @thread_count == Thread.list.count
    end
  end

  it 'can disable stats' 


  describe 'per host jobs' do
    it "correctly schedules on multiple hosts" 

  end

  describe '#sync' do

    it 'increases' 

  end

  describe '#tick' do

    it 'should nuke missing jobs' 


    it 'should recover from crashed manager' 


    it 'should log when job finishes running' 


    it 'should only run pending job once' 


  end

  describe '#discover_schedules' do
    it 'Discovers Testing::RandomJob' 

  end

  describe '#next_run' do
    it 'should be within the next 5 mins if it never ran' 

  end
end

