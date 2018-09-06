require "rails_helper"

describe Retryable do
  context "a successful job" do
    class RetryableTestJob < ActiveJob::Base
      include Retryable

      def perform
      end
    end

    it "does nothing" 

  end

  context "a failing job" do
    class ParentJob < ActiveJob::Base
      include Retryable

      mattr_accessor :exhausted, :counter

      def perform
        self.counter ||= 0
        self.counter += 1

        if counter < 3
          raise "max attempts"
        end
      end
    end

    class RetryableFailingJob < ParentJob
    end

    class ExhaustedJob < ParentJob
      def after_retry_exhausted
        self.exhausted = true
      end
    end

    before do
      RetryableFailingJob.counter = 0
      RetryableFailingJob.exhausted = nil
    end

    it "retries until it exhausts the attempts" 


    it "retries until it passes" 


    it "retries the job with the configured wait" 


    context "when `after_retry_exhausted` exists" do
      it "calls `after_retry_exhausted` after retrying" 

    end

    context "when `after_retry_exhausted` does not exists" do
      it "does not call it" 

    end
  end
end

