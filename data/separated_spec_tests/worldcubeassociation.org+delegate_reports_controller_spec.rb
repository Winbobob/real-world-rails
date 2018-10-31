# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DelegateReportsController do
  let(:delegate) { FactoryBot.create :delegate }
  let(:comp) { FactoryBot.create(:competition, delegates: [delegate], starts: 2.days.ago) }
  let(:pre_delegate_reports_form_comp) { FactoryBot.create(:competition, delegates: [delegate], starts: Date.new(2015, 1, 1)) }

  context "not logged in" do
    it "redirects to sign in" 

  end

  context "logged in as a regular user" do
    sign_in { FactoryBot.create(:user) }

    it "redirects to home page" 

  end

  context "logged in as a regular delegate" do
    sign_in { FactoryBot.create(:delegate) }

    it "redirects to home page" 


    it "redirects to home page" 

  end

  context "logged in as THE delegate" do
    let(:user) { comp.delegates.first }
    before :each do
      sign_in user
    end

    it "can view edit page" 


    it "can edit report" 


    it "can edit and post report before comp is over" 


    it "can post report and cannot edit report if it's posted" 


    it "posting report for an ancient competition doesn't send email notification" 

  end
end

