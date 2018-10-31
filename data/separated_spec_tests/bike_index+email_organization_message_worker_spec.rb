require "spec_helper"

describe EmailOrganizationMessageWorker do
  let(:subject) { EmailOrganizationMessageWorker }
  let(:instance) { subject.new }
  it { is_expected.to be_processed_in :notify }

  context "delivery failed" do
    let(:organization_message) { FactoryGirl.create(:organization_message, delivery_status: "failure") }
    it "does not send" 

  end
  context "delivery succeeded" do
    let(:organization_message) { FactoryGirl.create(:organization_message, delivery_status: "success") }
    it "does not send" 

  end
  context "delivery_status nil" do
    let(:organization_message) { FactoryGirl.create(:organization_message, delivery_status: nil) }
    it "sends an email" 

  end
end

