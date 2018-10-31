require 'rails_helper'

RSpec.describe SponsorMailer, type: :mailer do
  let :creator do
    FactoryBot.create(:validated_signature, name: "Barry Butler", email: "bazbutler@gmail.com")
  end

  let :petition do
    FactoryBot.create(:pending_petition,
      creator: creator,
      action: "Allow organic vegetable vans to use red diesel",
      background: "Add vans to permitted users of red diesel",
      additional_details: "To promote organic vegetables"
    )
  end

  let :sponsor do
    FactoryBot.create(:sponsor, :pending, name: "Ally Adams", email: 'allyadams@outlook.com', petition: petition)
  end

  describe "#petition_and_email_confirmation_for_sponsor" do
    subject(:mail) { described_class.petition_and_email_confirmation_for_sponsor(sponsor) }

    it "has the correct subject" 


    it "sends it only to the sponsor" 


    it "includes the creator's name in the body" 


    it "includes the verification url for the sponsor's signature" 


    it "includes the petition action" 


    it "includes the petition background" 


    it "includes the petition additional details" 

  end

  describe "#sponsor_signed_email_below_threshold" do
    subject(:mail) { described_class.sponsor_signed_email_below_threshold(petition, sponsor) }

    context "when the number of supporters is 1" do
      before do
        allow(petition).to receive_message_chain(:sponsors, :validated, :count).and_return(1)
      end

      it "pluralizes supporters correctly" 

    end

    context "when the number of supporters is more than 1" do
      before do
        allow(petition).to receive_message_chain(:sponsors, :validated, :count).and_return(2)
      end

      it "pluralizes supporters correctly" 

    end
  end

  describe "#sponsor_signed_email_on_threshold" do
    subject(:mail) { described_class.sponsor_signed_email_on_threshold(petition, sponsor) }

    before do
      allow(petition).to receive_message_chain(:sponsors, :validated, :count).and_return(5)
    end

    shared_examples_for "a sponsor signed on threshold email" do
      it "has the correct subject" 


      it "sends it only to the creator" 


      it "includes the creator's name in the body" 


      it "includes the sponsor's name in the body" 


      it "includes the petition action" 


      it "doesn't include the petition background" 


      it "doesn't include the petition additional details" 


      it "includes the sponsor count" 


      it "tells the creator that the petition is being checked" 

    end

    context "before the Christmas period" do
      around do |example|
        travel_to("2017-12-21") { example.run }
      end

      it_behaves_like "a sponsor signed on threshold email"

      it "doesn't include the moderation delay message" 

    end

    context "during the Christmas period" do
      around do |example|
        travel_to("2017-12-26") { example.run }
      end

      it_behaves_like "a sponsor signed on threshold email"

      it "includes the moderation delay message" 

    end

    context "after the Christmas period" do
      around do |example|
        travel_to("2018-01-05") { example.run }
      end

      it_behaves_like "a sponsor signed on threshold email"

      it "doesn't include the moderation delay message" 

    end

    context "before the Easter period" do
      around do |example|
        travel_to("2018-03-29") { example.run }
      end

      it_behaves_like "a sponsor signed on threshold email"

      it "doesn't include the moderation delay message" 

    end

    context "during the Easter period" do
      around do |example|
        travel_to("2018-04-01") { example.run }
      end

      it_behaves_like "a sponsor signed on threshold email"

      it "includes the moderation delay message" 

    end

    context "after the Easter period" do
      around do |example|
        travel_to("2018-04-10") { example.run }
      end

      it_behaves_like "a sponsor signed on threshold email"

      it "doesn't include the moderation delay message" 

    end
  end
end

