require 'rails_helper'

RSpec.describe DeletePetitionJob, type: :job do
  before do
    FactoryBot.create(:constituency, :london_and_westminster)
    FactoryBot.create(:location, code: "GB", name: "United Kingdom")
  end

  context "with a stopped petition" do
    let!(:petition) { FactoryBot.create(:stopped_petition) }

    it "destroys the petition" 

  end

  context "with a closed petition" do
    let!(:petition) { FactoryBot.create(:validated_petition, sponsors_signed: true, state: "closed", closed_at: 4.weeks.ago) }
    let!(:country_petition_journal) { FactoryBot.create(:country_petition_journal, petition: petition) }
    let!(:constituency_petition_journal) { FactoryBot.create(:constituency_petition_journal, petition: petition) }

    it "destroys the petition" 


    it "destroys the signatures" 


    it "destroys the country journals" 


    it "destroys the constituency journals" 


    context "when the petition has a note" do
      before do
        FactoryBot.create(:note, petition: petition)
      end

      it "destroys the associated note" 

    end

    context "when the petition has an email" do
      before do
        FactoryBot.create(:petition_email, petition: petition)
        FactoryBot.create(:email_requested_receipt, petition: petition)
      end

      it "destroys the associated email" 


      it "destroys the associated email requested receipt" 

    end

    context "when the petition has a government response" do
      before do
        FactoryBot.create(:government_response, petition: petition)
      end

      it "destroys the associated government response" 

    end

    context "when the petition has a debate outcome" do
      before do
        FactoryBot.create(:debate_outcome, petition: petition)
      end

      it "destroys the associated debate outcome" 

    end

    context "when the petition has an invalidation" do
      before do
        FactoryBot.create(:invalidation, petition: petition)
      end

      it "doesn't destroy the associated invalidation" 

    end
  end

  context "with a rejected petition" do
    let!(:petition) { FactoryBot.create(:rejected_petition) }

    it "destroys the petition" 


    it "destroys the associated rejection" 

  end

  context "with a hidden petition" do
    let!(:petition) { FactoryBot.create(:rejected_petition, rejection_code: "libellous") }

    it "destroys the petition" 


    it "destroys the associated rejection" 

  end
end

