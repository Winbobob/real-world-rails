require 'rails_helper'

RSpec.describe EmailReminder do
  describe "threshold_email_reminders" do
    before :each do
      @user1 = FactoryBot.create(:moderator_user, :email => 'peter@directgov.uk')
      @user2 = FactoryBot.create(:moderator_user, :email => 'richard@directgov.uk')
      @p1 = FactoryBot.create(:open_petition)
      @p1.update_attribute(:signature_count, 11)
      @p2 = FactoryBot.create(:closed_petition)
      @p2.update_attribute(:signature_count, 10)
      @p3 = FactoryBot.create(:open_petition)
      @p3.update_attribute(:signature_count, 9)
      @p4 = FactoryBot.create(:open_petition, :notified_by_email => true)

      allow(Site).to receive(:threshold_for_debate).and_return(10)
    end

    it "should email out an alert to moderator users for petitions that have reached their threshold or have been marked as requiring a response" 


    it "should email out details of three petitions and set the notified_by_email flag to true" 

  end

  describe "special_resend_of_signature_email_validation" do

    let(:beginning_of_september) { Time.parse("2011-09-01 00:00") }
    let(:petition) { FactoryBot.create(:petition) }
    let!(:validated_signature) { FactoryBot.create(:signature, :petition => petition, :created_at => beginning_of_september, :updated_at => beginning_of_september) }
    let!(:recent_signature) { FactoryBot.create(:pending_signature, :petition => petition) }

    before do
      @signatures = []
      3.times do
        @signatures << FactoryBot.create(:pending_signature, :petition => petition, :created_at => beginning_of_september, :updated_at => beginning_of_september)
      end
    end

    it "sends emails to pending signatures last updated before 14th August 2011" 


    it "updates the time so they aren't sent again" 


    it "allows customisation of the last updated time" 



    context "syntax error in email" do
      let(:mail) { double }
      before do
        allow(PetitionMailer).to receive_messages(:special_resend_of_email_confirmation_for_signer => mail)
        allow(mail).to receive(:deliver_now).and_raise Net::SMTPSyntaxError
      end

      it "continues" 


      it "still updates the timestamp" 

    end
  end
end

