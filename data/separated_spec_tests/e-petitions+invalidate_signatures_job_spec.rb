require 'rails_helper'

RSpec.describe InvalidateSignaturesJob, type: :job do
  let(:invalidation) { FactoryBot.create(:invalidation, ip_address: "10.0.1.1") }
  let(:exception_class) { ActiveJob::DeserializationError }

  context "when the invalidation is present" do
    let!(:petition) { FactoryBot.create(:open_petition) }
    let!(:signature_1) { FactoryBot.create(:validated_signature, ip_address: "10.0.1.1", petition: petition) }
    let!(:signature_2) { FactoryBot.create(:validated_signature, ip_address: "192.168.1.1", petition: petition) }

    it "performs the invalidation process" 

  end

  context "when the invalidation has been deleted" do
    before do
      Invalidation.delete(invalidation)
    end

    it "notifies Appsignal of the error" 


    it "doesn't raise an error" 

  end
end

