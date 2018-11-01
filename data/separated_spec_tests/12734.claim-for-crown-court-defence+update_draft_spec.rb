require 'rails_helper'

RSpec.describe Claims::UpdateDraft do

  after(:all) do
    clean_database
  end

  context 'draft claim updates' do
    let(:original_case_number) { 'A20161234' }
    let(:claim) { FactoryBot.create :advocate_claim, case_number: original_case_number }
    let(:claim_params) { { case_number: 'A20165555' } }
    let(:validate) { true }

    subject(:update_draft) { described_class.new(claim, params: claim_params, validate: validate) }

    it 'defines the action' 


    it 'is a draft' 


    context 'successful draft updates' do
      context 'validation enabled' do
        let(:validate) { true }

        it 'forces validation if indicated' 

      end

      context 'validation not enabled' do
        let(:validate) { false }

        it 'forces validation if indicated' 

      end

      it 'updates the source when editing an API submitted claim' 


      it 'updates the source when editing a JSON imported claim' 


      it 'is successful' 

    end

    context 'unsuccessful draft updates' do
      let(:claim_params) { { case_number: '123' } }

      it 'is unsuccessful' 

    end

    context 'updating a previously submitted claim that was saved as a draft with an invalid associated record' do
      let(:fee_type) { create(:interim_fee_type, :warrant) }
      let(:claim) { FactoryBot.create :interim_claim, case_number: 'A20161234' }
      let(:draft_claim_params) {
        {
          "form_step" => "fees",
          "interim_fee_attributes" => {
            "fee_type_id" => fee_type.id,
            "quantity"=>"",
            "warrant_issued_date_dd" => "",
            "warrant_issued_date_mm" => "",
            "warrant_issued_date_yyyy" => "",
            "warrant_executed_date_dd" => "",
            "warrant_executed_date_mm" => "",
            "warrant_executed_date_yyyy" => "",
            "amount" => ""
          }
        }
      }

      before do
        described_class.new(claim, params: draft_claim_params, validate: false).call
      end

      context 'when current form step does not require the invalid record to be validated' do
        let(:new_case_number) { 'A20165555' }
        let(:claim_params) {
          {
            "form_step" => "case_details",
            "case_number" => new_case_number
          }
        }

        it 'successfully updates the claim with the submitted params' 

      end

      context 'when current form step requires the invalid record to be validated' do
        let(:claim_params) {
          {
            "form_step" => "interim_fees",
            "case_number" => 'A20165555'
          }
        }

        it 'does not update the claim' 

      end
    end
  end
end
