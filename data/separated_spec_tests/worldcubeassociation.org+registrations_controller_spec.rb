# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RegistrationsController do
  def stripe_token_id(options = {})
    default_card = {
      number: "4242424242424242",
      exp_month: 12,
      exp_year: Time.now.year + 1,
      cvc: "314",
    }
    default_card.merge!(options)
    Stripe::Token.create(
      card: default_card,
    ).id
  end

  context "signed in as organizer" do
    let(:organizer) { FactoryBot.create(:user) }
    let(:competition) { FactoryBot.create(:competition, :registration_open, organizers: [organizer], events: Event.where(id: %w(222 333))) }
    let(:zzyzx_user) { FactoryBot.create :user, name: "Zzyzx" }
    let(:registration) { FactoryBot.create(:registration, competition: competition, user: zzyzx_user) }

    before :each do
      sign_in organizer
    end

    it 'allows access to competition organizer' 


    it 'cannot set events that are not offered' 


    it 'cannot change registration of a different competition' 


    it "accepts a pending registration" 


    it "changes an accepted registration to pending" 


    it "can delete registration" 


    it "can delete multiple registrations" 


    it "can reject multiple registrations" 


    it "can accept multiple registrations" 


    describe "with views" do
      render_views
      it "does not update registration that changed" 

    end

    it "can accept own registration" 


    it "can register for their own competition that is not yet visible" 

  end

  context "signed in as competitor" do
    let!(:user) { FactoryBot.create(:user, :wca_id) }
    let!(:delegate) { FactoryBot.create(:delegate) }
    let!(:competition) { FactoryBot.create(:competition, :registration_open, delegates: [delegate], showAtAll: true) }
    let(:threes_comp_event) { competition.competition_events.find_by(event_id: "333") }

    before :each do
      sign_in user
    end

    it "can create registration" 


    it "can re-create registration after it was deleted" 


    it "can delete registration when on waitlist" 


    it "cannot delete registration when approved" 


    it "cannnot delete other people's registrations" 


    it "cannot create accepted registration" 


    it "cannot create registration when competition is not visible" 


    it "cannot create registration after registration is closed" 


    it "can edit registration when pending" 


    it "cannot edit registration when approved" 


    it "cannot access edit page" 


    it "cannot edit someone else's registration" 


    it "cannot accept own registration" 

  end

  context "register" do
    let(:competition) { FactoryBot.create :competition, :confirmed, :visible, :registration_open }

    it "redirects to competition root if competition is not using WCA registration" 


    it "works when not logged in" 


    it "finds registration when logged in and not registered" 


    it "creates registration when logged in and not registered" 

  end

  context "competition not visible" do
    let(:organizer) { FactoryBot.create :user }
    let(:competition) { FactoryBot.create(:competition, :registration_open, events: Event.where(id: %w(333 444 333bf)), showAtAll: false, organizers: [organizer]) }

    it "404s when competition is not visible to public" 


    it "organizer can access psych sheet" 

  end

  context "psych sheet when results posted" do
    let(:competition) { FactoryBot.create(:competition, :visible, :past, :results_posted, use_wca_registration: true, events: Event.where(id: "333")) }

    it "renders psych_results_posted" 

  end

  context "psych sheet when not signed in" do
    let!(:competition) { FactoryBot.create(:competition, :confirmed, :visible, :registration_open, events: Event.where(id: %w(333 444 333bf))) }

    it "redirects psych sheet to 333" 


    it "redirects to root if competition is not using WCA registration" 


    it "redirects psych sheet to highest ranked event if no 333" 


    it "does not show pending registrations" 


    it "handles user without average" 


    it "sorts 444 by single, and average, and handles ties" 


    it "handles missing average" 


    it "handles 1 registration" 


    it "sorts 333bf by single" 


    it "shows first timers on bottom" 


    it "handles 1 registration" 

  end

  describe 'POST #process_payment' do
    context 'when not signed in' do
      let(:competition) { FactoryBot.create(:competition, :stripe_connected, :visible, :registration_open, events: Event.where(id: %w(222 333))) }
      sign_out

      it 'redirects to the sign in page' 

    end

    context 'when signed in' do
      let(:competition) { FactoryBot.create(:competition, :stripe_connected, :visible, :registration_open, events: Event.where(id: %w(222 333))) }
      let!(:user) { FactoryBot.create(:user, :wca_id) }
      let!(:registration) { FactoryBot.create(:registration, competition: competition, user: user) }

      before :each do
        sign_in user
      end

      it 'processes payment with valid credit card' 


      it 'processes payment with donation and valid credit card' 


      it 'rejects insufficient payment with valid credit card' 


      it 'rejects payment with invalid credit card' 

    end
  end

  describe 'POST #refund_payment' do
    context 'when signed in as a competitor' do
      let(:competition) { FactoryBot.create(:competition, :stripe_connected, :visible, :registration_open, events: Event.where(id: %w(222 333))) }
      let!(:user) { FactoryBot.create(:user, :wca_id) }
      let!(:registration) { FactoryBot.create(:registration, competition: competition, user: user) }

      it 'does not allow access and generates a URL error' 

    end

    context 'when signed in as organizer' do
      let(:organizer) { FactoryBot.create(:user) }
      let(:competition) { FactoryBot.create(:competition, :stripe_connected, :visible, :registration_open, organizers: [organizer], events: Event.where(id: %w(222 333))) }
      let!(:registration) { FactoryBot.create(:registration, competition: competition, user: organizer) }

      context "processes a payment" do
        before :each do
          sign_in organizer
          token_id = stripe_token_id
          post :process_payment, params: { competition_id: competition.id, payment: { stripe_token: token_id, total_amount: registration.outstanding_entry_fees.cents } }
          @payment = registration.reload.registration_payments.first
        end

        it 'issues a full refund' 


        it 'issues a 50% refund' 


        it 'disallows negative refund' 


        it 'disallows a refund more than the payment' 

      end
    end
  end
end

