require 'rails_helper'

RSpec.describe NotifyEveryoneOfModerationDecisionJob, type: :job do
  let(:petition) { FactoryBot.create(:pending_petition, sponsor_count: 0) }
  let(:creator) { petition.creator }
  let(:validated_sponsor) { FactoryBot.create(:sponsor, :validated, petition: petition) }
  let(:pending_sponsor) { FactoryBot.create(:sponsor, :pending, petition: petition) }

  context "when the petition is published" do
    before do
      petition.publish
    end

    it "notifies the creator" 


    it "notifies the validated sponsors" 


    it "doesn't notify the pending sponsors" 

  end

  context "when the petition is rejected" do
    before do
      petition.reject(code: "duplicate")
    end

    it "notifies the creator" 


    it "notifies the validated sponsors" 


    it "doesn't notify the pending sponsors" 

  end

  context "when the petition is hidden" do
    before do
      petition.reject(code: "offensive")
    end

    it "notifies the creator" 


    it "notifies the validated sponsors" 


    it "doesn't notify the pending sponsors" 

  end
end

