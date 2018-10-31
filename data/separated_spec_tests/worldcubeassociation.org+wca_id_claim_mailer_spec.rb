# frozen_string_literal: true

require "rails_helper"

RSpec.describe WcaIdClaimMailer, type: :mailer do
  describe "notify_wcat_of_confirmed_competition" do
    let(:delegate) { FactoryBot.create :delegate }
    let(:person) { FactoryBot.create :person }
    let(:user_claiming_wca_id) { FactoryBot.create :user, unconfirmed_wca_id: person.wca_id, delegate_to_handle_wca_id_claim: delegate, dob_verification: person.dob }
    let(:mail) { WcaIdClaimMailer.notify_delegate_of_wca_id_claim(user_claiming_wca_id) }

    it "renders" 

  end

  describe "notify_user_of_delegate_demotion" do
    let(:senior_delegate) { FactoryBot.create :senior_delegate }
    let(:demoted_delegate) { FactoryBot.create :user, name: "Sherlock Holmes" }
    let(:user_claiming_wca_id) { FactoryBot.create :user, name: "Bilbo Baggins" }
    let(:mail) { WcaIdClaimMailer.notify_user_of_delegate_demotion(user_claiming_wca_id, demoted_delegate) }
    let(:mail_with_senior) { WcaIdClaimMailer.notify_user_of_delegate_demotion(user_claiming_wca_id, demoted_delegate, senior_delegate) }

    it "sets appropriate headers" 


    it "replies to senior delegate as well if present" 


    it "renders body" 

  end
end

