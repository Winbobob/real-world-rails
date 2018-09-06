# frozen_string_literal: true

require "rails_helper"

RSpec.describe RegistrationsMailer, type: :mailer do
  let(:delegate1) { FactoryBot.create :delegate }
  let(:delegate2) { FactoryBot.create :delegate }
  let(:organizer1) { FactoryBot.create :user }
  let(:organizer2) { FactoryBot.create :user }
  let(:competition_without_organizers) { FactoryBot.create(:competition, :registration_open, delegates: [delegate1, delegate2]) }
  let(:competition_with_organizers) { FactoryBot.create(:competition, :registration_open, delegates: [delegate1, delegate2], organizers: [organizer1, organizer2]) }

  describe "notify registrants in their language" do
    let(:french_user) { FactoryBot.create :user, :wca_id, :french_locale }
    let(:registration) { FactoryBot.create(:registration, user: french_user, competition: competition_with_organizers) }
    let(:mail_new) { RegistrationsMailer.notify_registrant_of_new_registration(registration) }
    let(:mail_accepted) { RegistrationsMailer.notify_registrant_of_accepted_registration(registration) }
    let(:mail_pending) { RegistrationsMailer.notify_registrant_of_pending_registration(registration) }
    let(:mail_deleted) { RegistrationsMailer.notify_registrant_of_deleted_registration(registration) }

    it "renders the headers in foreign locale" 


    it "renders the body in foreign locale" 

  end

  describe "notify_organizers_of_new_registration" do
    let(:registration) { FactoryBot.create(:registration, competition: competition_without_organizers) }
    let(:mail) { RegistrationsMailer.notify_organizers_of_new_registration(registration) }

    it "renders the headers" 


    it "renders the body" 


    it "handles no organizers receiving email" 

  end

  describe "notify_organizers_of_deleted_registration" do
    let(:registration) { FactoryBot.create(:registration, competition: competition_without_organizers) }
    let(:mail) { RegistrationsMailer.notify_organizers_of_deleted_registration(registration) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "notify_registrant_of_new_registration for competition without organizers" do
    let(:registration) { FactoryBot.create(:registration, competition: competition_without_organizers) }
    let!(:earlier_registration) { FactoryBot.create(:registration, competition: competition_without_organizers) }
    let(:mail) { RegistrationsMailer.notify_registrant_of_new_registration(registration) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "notify_registrant_of_new_registration for competition with organizers" do
    let(:registration) { FactoryBot.create(:registration, competition: competition_with_organizers) }
    let(:mail) { RegistrationsMailer.notify_registrant_of_new_registration(registration) }

    it "sets organizers in the reply_to" 


    it "displays organizer names in the signature" 

  end

  describe "notify_registrant_of_accepted_registration for competition without organizers" do
    let(:mail) { RegistrationsMailer.notify_registrant_of_accepted_registration(registration) }
    let(:registration) { FactoryBot.create(:registration, competition: competition_without_organizers) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "notify_registrant_of_accepted_registration for competition with organizers" do
    let(:mail) { RegistrationsMailer.notify_registrant_of_accepted_registration(registration) }
    let(:registration) { FactoryBot.create(:registration, competition: competition_with_organizers) }

    it "sets organizers in the reply_to" 


    it "displays organizer names in the signature" 

  end

  describe "notify_registrant_of_pending_registration for a competition without organizers" do
    let(:mail) { RegistrationsMailer.notify_registrant_of_pending_registration(registration) }
    let(:registration) { FactoryBot.create(:registration, competition: competition_without_organizers) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "notify_registrant_of_pending_registration for a competition with organizers" do
    let(:mail) { RegistrationsMailer.notify_registrant_of_pending_registration(registration) }
    let(:registration) { FactoryBot.create(:registration, competition: competition_with_organizers) }

    it "sets organizers in the reply_to" 


    it "displays organizer names in the signature" 

  end

  describe "notify_registrant_of_deleted_registration for a competition without organizers" do
    let(:mail) { RegistrationsMailer.notify_registrant_of_deleted_registration(registration) }
    let(:registration) { FactoryBot.create(:registration, competition: competition_without_organizers) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "notify_registrant_of_deleted_registration for a competition with organizers" do
    let(:mail) { RegistrationsMailer.notify_registrant_of_deleted_registration(registration) }
    let(:registration) { FactoryBot.create(:registration, competition: competition_with_organizers) }

    it "renders the headers" 


    it "renders the body" 

  end
end

