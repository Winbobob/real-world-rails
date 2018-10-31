# frozen_string_literal: true

require 'rails_helper'

class SuccessfulJob < ApplicationJob
  def perform
    puts "Succeeding!"
  end
end

class FailingJob < ApplicationJob
  def perform
    raise "Failure!"
  end
end

RSpec.describe Delayed::Plugins::SaveCompletedJobs, type: :feature do
  describe "call" do
    around(:each) do |example|
      old_delay_jobs = Delayed::Worker.delay_jobs
      old_queue_adapter = ActiveJob::Base.queue_adapter
      old_test_adapter = ActiveJob::Base._test_adapter
      Delayed::Worker.delay_jobs = true
      ActiveJob::Base.queue_adapter = :delayed_job
      ActiveJob::Base.disable_test_adapter
      example.run
      Delayed::Worker.delay_jobs = old_delay_jobs
      ActiveJob::Base.queue_adapter = old_queue_adapter
      ActiveJob::Base.enable_test_adapter(old_test_adapter)
    end

    it "stores completed jobs in completed_jobs table" 


    it "doesn't delete failed jobs, and notifies on failure" 

  end
end

