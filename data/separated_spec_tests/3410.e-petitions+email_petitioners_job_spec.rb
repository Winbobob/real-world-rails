require 'rails_helper'
require_relative '../shared_examples'

RSpec.describe Archived::EmailPetitionersJob, type: :job do
  let(:email_requested_at) { Time.current }
  let(:petition) { FactoryBot.create(:archived_petition) }
  let(:signature) { FactoryBot.create(:archived_signature, petition: petition) }
  let(:email) { FactoryBot.create(:archived_petition_email, petition: petition) }
  let(:arguments) { { petition: petition, email: email } }

  before do
    petition.set_email_requested_at_for('petition_email', to: email_requested_at)
    allow(petition).to receive_message_chain(:signatures_to_email_for, :find_each).and_yield(signature)
  end

  it_behaves_like "job to enqueue signatory mailing jobs"

  context "when the petition email has been deleted" do
    before do
      email.destroy
    end

    it "enqueues a job" 


    it "doesn't raise an error" 


    it "doesn't send any email" 

  end
end

