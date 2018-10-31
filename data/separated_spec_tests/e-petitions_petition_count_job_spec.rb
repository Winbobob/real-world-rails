require 'rails_helper'

RSpec.describe PetitionCountJob, type: :job do
  context "when there are no petitions with invalid signature counts" do
    let!(:petition) { FactoryBot.create(:open_petition) }

    it "doesn't update the signature count" 


    it "doesn't change the updated_at timestamp" 


    it "doesn't notify AppSignal" 

  end

  context "when there are petitions with invalid signature counts" do
    let!(:petition) { FactoryBot.create(:open_petition, signature_count: 100) }
    let(:exception_class) { PetitionCountJob::InvalidSignatureCounts }

    it "updates the signature count" 


    it "updates the updated_at timestamp" 


    it "notifies AppSignal" 

  end
end

