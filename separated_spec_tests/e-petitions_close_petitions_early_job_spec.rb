require 'rails_helper'

RSpec.describe ClosePetitionsEarlyJob, type: :job do
  let(:dissolution_at) { "2017-05-02T23:00:01Z".in_time_zone }
  let(:open_at) { dissolution_at - 4.weeks }
  let(:scheduled_at) { dissolution_at - 2.weeks }
  let(:before_dissolution) { dissolution_at - 1.week }
  let(:job) { Delayed::Job.last }
  let(:jobs) { Delayed::Job.all.to_a }

  let!(:petition) { FactoryBot.create(:open_petition, open_at: open_at) }

  before do
    ActiveJob::Base.queue_adapter = :delayed_job

    travel_to(scheduled_at) {
      described_class.schedule_for(dissolution_at)
    }
  end

  after do
    ActiveJob::Base.queue_adapter = :test
  end

  it "enqueues the job" 


  context "before the scheduled date" do
    it "doesn't perform the enqueued job" 

  end

  context "after the scheduled date" do
    it "closes the petition" 


    it "sets the closed_at to the correct timestamp" 

  end
end

