# encoding: utf-8
require 'rails_helper'
require 'scheduler/scheduler'

describe Scheduler::ScheduleInfo do

  let(:manager) { Scheduler::Manager.new }

  context "every" do
    class RandomJob
      extend ::Scheduler::Schedule

      every 1.hour

      def perform
        # work_it
      end
    end

    before do
      @info = manager.schedule_info(RandomJob)
      @info.del!
    end

    after do
      manager.stop!
      $redis.del manager.class.queue_key
    end

    it "is a scheduled job" 


    it 'starts off invalid' 


    it 'will have a due date in the next 5 minutes if it was blank' 


    it 'will have a due date within the next hour if it just ran' 


    it 'is invalid if way in the future' 

  end

  context "daily" do

    class DailyJob
      extend ::Scheduler::Schedule
      daily at: 11.hours

      def perform
      end
    end

    before do
      freeze_time Time.parse("2010-01-10 10:00:00")

      @info = manager.schedule_info(DailyJob)
      @info.del!
    end

    after do
      manager.stop!
      $redis.del manager.class.queue_key
    end

    it "is a scheduled job" 


    it "starts off invalid" 


    it "will have a due date at the appropriate time if blank" 


    it 'is invalid if way in the future' 

  end

end

