# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  describe "GET #edit" do
    let(:user) { FactoryBot.create(:user_with_wca_id) }

    sign_in { FactoryBot.create :admin }

    it "populates user" 

  end

  describe "claim wca id" do
    let!(:person) { FactoryBot.create(:person) }
    let!(:delegate) { FactoryBot.create(:delegate) }
    let!(:user) { FactoryBot.create(:user) }

    before :each do
      sign_in user
    end

    it "works" 


    it "cannot claim wca id for another user" 


    it "cannot claim wca id if already has a wca id" 

  end

  describe "approve wca id claim" do
    let(:delegate) { FactoryBot.create(:delegate) }
    let(:person) { FactoryBot.create(:person) }
    let(:user) { FactoryBot.create :user, unconfirmed_wca_id: person.wca_id, delegate_to_handle_wca_id_claim: delegate, dob_verification: person.dob }

    before :each do
      sign_in delegate
    end

    it "works when not explicitly clearing unconfirmed_wca_id" 


    it "works when explicitly clearing unconfirmed_wca_id" 


    it "can set id to something not claimed" 


    it "can change claimed id" 


    it "can clear claimed id" 

  end

  describe "editing user data" do
    let(:user) { FactoryBot.create(:user) }
    let(:delegate) { FactoryBot.create(:delegate) }

    it "user can change email" 


    it "user can change name" 


    it "user can change his preferred events" 


    context "after creating a pending registration" do
      let!(:registration) { FactoryBot.create(:registration, :pending, user: user) }
      it "user can change name" 

    end

    context "after having a registration deleted" do
      let!(:registration) { FactoryBot.create(:registration, :deleted, user: user) }
      it "user can change name" 

    end

    context "after registration is accepted for a competition" do
      let!(:registration) { FactoryBot.create(:registration, :accepted, user: user) }

      it "user cannot change name" 


      it "delegate can still change name" 

    end

    context "when the delegate status of a user is changed by a senior delegate" do
      let(:user_who_makes_the_change) { FactoryBot.create(:senior_delegate) }
      let(:user_senior_delegate) { FactoryBot.create(:senior_delegate) }
      let(:user_whose_delegate_status_changes) { FactoryBot.create(:delegate, delegate_status: "candidate_delegate", senior_delegate: user_senior_delegate) }

      it "notifies the board and the wqac via email" 

    end
  end

  describe "GET #index" do
    sign_in { FactoryBot.create :admin }

    it "is injection safe" 

  end
end

