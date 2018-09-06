require 'rails_helper'

RSpec.describe "setting job priorities" do
  before do
    ActiveJob::Base.queue_adapter = :delayed_job
  end

  describe "default priority" do
    it "is 100" 

  end

  describe "enqueuing" do
    let(:job) { Delayed::Job.last }
    let(:priority) { job.priority }

    before do
      job_class.perform_later
    end

    describe 'the highest priority job' do
      let(:job_class) do
        Class.new(ActiveJob::Base) do
          queue_as :highest_priority

          def perform
            logger.info("Highest priority job")
          end
        end
      end

      it "is queued with a priority of 0" 

    end

    describe "a high priority job" do
      let(:job_class) do
        Class.new(ActiveJob::Base) do
          queue_as :high_priority

          def perform
            logger.info("High priority job")
          end
        end
      end

      it "is queued with a priority of 10" 

    end

    describe "a low priority job" do
      let(:job_class) do
        Class.new(ActiveJob::Base) do
          queue_as :low_priority

          def perform
            logger.info("Low priority job")
          end
        end
      end

      it "is queued with a priority of 50" 

    end

    describe "an unclassified job" do
      let(:job_class) do
        Class.new(ActiveJob::Base) do
          queue_as :unclassified

          def perform
            logger.info("Unclassified job")
          end
        end
      end

      it "is queued with a priority of 25" 

    end
  end
end

