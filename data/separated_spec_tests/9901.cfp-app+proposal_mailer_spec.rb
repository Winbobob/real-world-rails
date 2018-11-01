require "rails_helper"

describe Organizer::ProposalMailer do
  let(:event) { create(:event) }
  let(:speaker) { create(:speaker) }
  let(:proposal) { create(:proposal, event: event, speakers: [speaker]) }

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  describe "accept_email" do
    let(:mail) { Organizer::ProposalMailer.accept_email(event, proposal) }

    it "emails to all speakers including contact_mail" 


    it "uses event's accept template" 


    it "uses the default template if event's accept is blank" 


    it "gives the speaker the ability to submit feedback and ask any questions they may have" 

  end

  describe "reject_email" do
    let(:mail) { Organizer::ProposalMailer.reject_email(event, proposal) }

    it "bccs to all speakers including contact_mail" 


    it "uses event's reject template" 


    it "uses the default template if event's reject is blank" 

  end

  describe "waitlist_email" do
    let(:mail) { Organizer::ProposalMailer.waitlist_email(event, proposal) }

    it "bccs to all speakers including contact_mail" 


    it "uses event's waitlist template" 


    it "uses the default template if event's waitlist is blank" 

  end
end

