require 'rails_helper'

RSpec.describe PetitionSignedDataUpdateJob, type: :job do
  let(:signature) { FactoryBot.create(:pending_signature, petition: petition, created_at: 2.days.ago, updated_at: 2.days.ago) }

  def running_the_job
    perform_enqueued_jobs {
      described_class.perform_later(signature)
    }
  end
  alias_method :run_the_job, :running_the_job

  context 'when the signature has gone away' do
    let(:petition) { FactoryBot.create(:open_petition, created_at: 2.days.ago, updated_at: 2.days.ago) }

    before do
      Signature.delete(signature)
    end

    it 'notifies appsignal of the deserialization problem' 


    it 'does not raise the deserialization problem (which would cause the worker to requeue the job)' 

  end

  context "when the petition is open" do
    let(:petition) { FactoryBot.create(:open_petition, created_at: 2.days.ago, updated_at: 2.days.ago) }

    it "increments the petition count" 


    it "updates the petition to say it was updated just now" 


    it "updates the petition to say it was last signed at just now" 


    it 'tells the relevant constituency petition journal to record a new signature' 


    it 'tells the relevant country petition journal to record a new signature' 

  end

  context "when the petition is pending" do
    let(:petition) { FactoryBot.create(:pending_petition, created_at: 2.days.ago, updated_at: 2.days.ago) }

    it "increments the petition count" 


    it "updates the petition to say it was updated just now" 


    it "updates the petition to say it was last signed at just now" 


    it 'tells the relevant constituency petition journal to record a new signature' 


    it 'tells the relevant country petition journal to record a new signature' 


    context 'and the signature is a sponsor' do
      let(:petition) { FactoryBot.create(:petition) }
      let(:signature) { FactoryBot.create(:sponsor, :pending, petition: petition) }

      it "sets petition state to validated" 


      it 'sends email notification to the petition creator' 


      context "and the petition is published" do
        before do
          petition.publish
          petition.reload
          ActionMailer::Base.deliveries.clear
        end

        it "does not send an email to the creator" 

      end
    end
  end
end

