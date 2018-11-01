# frozen_string_literal: true

require "rails_helper"

RSpec.describe JobFailureMailer, type: :mailer do
  describe "notify_admin_of_job_failure" do
    let(:job) { Delayed::Job.new(id: 42, handler: "I tried to take care of this") }
    let(:exception) do
      RuntimeError.new("error!").tap { |e| e.set_backtrace(["stack level 1", "stack level 2"]) }
    end
    let(:mail) { JobFailureMailer.notify_admin_of_job_failure(job, exception) }

    it "renders the headers" 


    it "renders the body" 

  end
end

