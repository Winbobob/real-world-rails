require 'rails_helper'

RSpec.describe BackfillSignatureUuidsJob, type: :job do
  let(:relation) { double(:relation) }

  context "when the uuid column is nil" do
    let(:signature) { FactoryBot.create(:signature, email: "alice@example.com") }
    let(:uuid) { "6613a3fd-c2c4-5bc2-a6de-3dc0b2527dd6" }

    before do
      signature.update_column(:uuid, nil)
      signature.reload
    end

    it "updates the signature column" 

  end

  context "when the uuid column is not nil" do
    let(:signature) { FactoryBot.create(:signature, email: "bob@example.com") }
    let(:uuid) { "6613a3fd-c2c4-5bc2-a6de-3dc0b2527dd6" }

    before do
      signature.update_column(:uuid, uuid)
      signature.reload
    end

    it "skips updating the uuid" 

  end
end

