# coding: utf-8

require 'rails_helper'

RSpec.feature 'Processing refund application with valid date received date', type: :feature do

  let(:jurisdiction) { create :jurisdiction }
  let(:office) { create :office, jurisdictions: [jurisdiction] }
  let(:user) { create :user, office: office }

  let(:online_application_1) do
    create(:online_application, :completed, :with_reference,
      married: false,
      children: 3,
      benefits: true,
      fee: 1550,
      form_name: 'D11',
      income_min_threshold_exceeded: false,
      refund: true,
      date_fee_paid: 4.months.ago,
      date_received: 2.months.ago,
      jurisdiction: jurisdiction)
  end

  let(:online_application_2) do
    create(:online_application, :completed, :with_reference,
      married: false,
      children: 3,
      benefits: true,
      fee: 1550,
      form_name: 'D11',
      income_min_threshold_exceeded: false,
      refund: true,
      date_fee_paid: 5.months.ago,
      date_received: 3.months.ago,
      jurisdiction: jurisdiction)
  end

  let(:dwp_response) { 'Yes' }

  before do
    login_as user
    dwp_api_response dwp_response
  end

  context 'Online refund application' do
    it "do not fail when valid date" 


    it "ignore date_received date because it was already validated" 


  end

  context 'Postal refund application' do
    let(:applicant) { build :applicant_with_all_details }
    let(:application) { build :application, applicant: applicant }

    context 'with benefits' do
      it "valid date" 


      context 'failed dwp' do
        let(:dwp_response) { 'No' }

        it "failed paper evidence" 

      end

      context 'invalid date' do

        it "discretion denied" 


        it "discretion granted" 

      end
    end

    context 'without benefits' do
      it "valid date" 


      it "invalid date discretion granted" 


      it "discretion granted" 

    end
  end
end

