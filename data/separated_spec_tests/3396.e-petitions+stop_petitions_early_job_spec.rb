require 'rails_helper'

RSpec.describe StopPetitionsEarlyJob, type: :job do
  let(:state) { Petition::PENDING_STATE }
  let(:special_consideration) { false }
  let(:created_at) { dissolution_at - 1.month }
  let(:dissolution_at) { "2017-05-02T23:00:01Z".in_time_zone }
  let(:scheduled_at) { dissolution_at - 2.weeks }
  let(:before_dissolution) { dissolution_at - 1.week }
  let(:notification_cutoff_at) { "2017-03-31T23:00:00Z".in_time_zone }
  let(:job) { Delayed::Job.last }
  let(:jobs) { Delayed::Job.all.to_a }
  let(:creator) { petition.creator }

  let!(:petition) do
    FactoryBot.create(
      :"#{state}_petition", created_at: created_at,
      special_consideration: special_consideration
    )
  end

  before do
    ActiveJob::Base.queue_adapter = :delayed_job

    allow(Parliament).to receive(:notification_cutoff_at).and_return(notification_cutoff_at)
    allow(Parliament).to receive(:dissolved?).and_return(true)

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
    it "stops the petition" 


    it "sets the stopped_at to the correct timestamp" 

  end

  context "when the petition is pending" do
    let(:state) { Petition::PENDING_STATE }

    context "and was created before the cutoff date" do
      let(:created_at) { notification_cutoff_at - 1.week }

      it "doesn't send a notification email" 


      it "stops the petition" 

    end

    context "and was created after the cutoff date" do
      let(:created_at) { notification_cutoff_at + 1.week }

      it "doesn't send a notification email" 


      it "stops the petition" 

    end
  end

  context "when the petition is validated" do
    let(:state) { Petition::VALIDATED_STATE }
    let(:email) { :notify_creator_of_validated_petition_being_stopped }

    context "and was created before the cutoff date" do
      let(:created_at) { notification_cutoff_at - 1.week }

      it "doesn't send a notification email" 


      it "stops the petition" 

    end

    context "and was created after the cutoff date" do
      let(:created_at) { notification_cutoff_at + 1.week }

      before do
        expect(PetitionMailer).to receive(email).with(creator).and_call_original
      end

      it "sends a notification email" 


      it "stops the petition" 

    end

    context "but is flagged for special consideration" do
      let(:created_at) { notification_cutoff_at + 1.week }
      let(:special_consideration) { true }

      before do
        expect(PetitionMailer).not_to receive(email)
      end

      it "doesn't send a notification email" 


      it "stops the petition" 

    end
  end

  context "when the petition is sponsored" do
    let(:state) { Petition::SPONSORED_STATE }
    let(:email) { :notify_creator_of_sponsored_petition_being_stopped }

    context "and was created before the cutoff date" do
      let(:created_at) { notification_cutoff_at - 1.week }

      it "doesn't send a notification email" 


      it "stops the petition" 

    end

    context "and was created after the cutoff date" do
      let(:created_at) { notification_cutoff_at + 1.week }

      before do
        expect(PetitionMailer).to receive(email).with(creator).and_call_original
      end

      it "sends a notification email" 


      it "stops the petition" 

    end

    context "but is flagged for special consideration" do
      let(:created_at) { notification_cutoff_at + 1.week }
      let(:special_consideration) { true }

      before do
        expect(PetitionMailer).not_to receive(email)
      end

      it "doesn't send a notification email" 


      it "stops the petition" 

    end
  end
end

