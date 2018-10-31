require 'rails_helper'

describe JobsController do
  describe "GET index" do
    before do
      async_handler_yaml =
        "--- !ruby/object:ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper\njob_data:\n  job_class: AgentCheckJob\n  job_id: 123id\n  queue_name: default\n  arguments:\n  - %d\n"

      Delayed::Job.create!(handler: async_handler_yaml % [agents(:jane_website_agent).id])
      Delayed::Job.create!(handler: async_handler_yaml % [agents(:bob_website_agent).id])
      Delayed::Job.create!(handler: async_handler_yaml % [agents(:jane_weather_agent).id])
      agents(:jane_website_agent).destroy
      Delayed::Job.create!(handler: async_handler_yaml % [agents(:bob_weather_agent).id], locked_at: Time.now, locked_by: 'test')

      expect(Delayed::Job.count).to be > 0
    end

    it "does not allow normal users" 


    it "returns all jobs" 

  end

  describe "DELETE destroy" do
    before do
      @not_running = Delayed::Job.create
      @running = Delayed::Job.create(locked_at: Time.now, locked_by: 'test')
      sign_in users(:jane)
    end

    it "destroy a job which is not running" 


    it "does not destroy a running job" 

  end

  describe "PUT run" do
    before do
      @not_running = Delayed::Job.create(run_at: Time.now - 1.hour)
      @running = Delayed::Job.create(locked_at: Time.now, locked_by: 'test')
      @failed = Delayed::Job.create(run_at: Time.now - 1.hour, locked_at: Time.now, failed_at: Time.now)
      sign_in users(:jane)
    end

    it "queue a job which is not running" 


    it "queue a job that failed" 


    it "not queue a running job" 

  end

  describe "DELETE destroy_failed" do
    before do
      @failed = Delayed::Job.create(failed_at: Time.now - 1.minute)
      @running = Delayed::Job.create(locked_at: Time.now, locked_by: 'test')
      @pending = Delayed::Job.create
      sign_in users(:jane)
    end

    it "just destroy failed jobs" 

  end

  describe "DELETE destroy_all" do
    before do
      @failed = Delayed::Job.create(failed_at: Time.now - 1.minute)
      @running = Delayed::Job.create(locked_at: Time.now, locked_by: 'test')
      @pending = Delayed::Job.create
      sign_in users(:jane)
    end

    it "destroys all jobs" 

  end

  describe "POST retry_queued" do
    before do
      @not_running = Delayed::Job.create(run_at: Time.zone.now - 1.hour)
      @not_running.update_attribute(:attempts, 1)
      sign_in users(:jane)
    end

    it "run the queued job" 

  end
end

