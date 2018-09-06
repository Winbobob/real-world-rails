require 'rails_helper'
require_relative 'shared_examples_for_advocate_litigator'
require_relative 'shared_examples_for_step_validators'

RSpec.describe Claim::TransferClaimValidator, type: :validator do
  include_context "force-validation"

  let(:claim) { build :transfer_claim }
  let(:transfer_detail) { build :transfer_detail, claim: claim }

  include_examples 'common partial validations', [
    %i[
      litigator_type
      elected_case
      transfer_stage_id
      transfer_date
      case_conclusion_id
      transfer_detail_combo
    ],
    %i[
      court
      case_number
      case_transferred_from_another_court
      transfer_court
      transfer_case_number
      case_concluded_at
      supplier_number
      amount_assessed
      evidence_checklist_ids
    ],
    [],
    %i[offence],
    %i[transfer_fee],
    %i[total]
  ]

  before do
    claim.form_step = :case_details
    claim.force_validation = true
  end

  context 'litigator type' do
    it 'errors if not new or original' 


    it 'is valid if new or original' 

  end

  context 'elected_case' do
    it 'errors if nil' 


    it 'is valid if true or false' 

  end

  context 'transfer_stage_id' do
    it 'errors if invalid id' 


    it 'is valid if a valid value' 

  end

  context 'transfer_date' do
    it 'errors if blank' 


    it 'errors if in future' 


    it 'errors if too far in the past' 


    it 'is valid if in the recent past' 

  end

  context 'trial dates validation' do
    context 'case type: trial' do
      let(:claim) { build(:transfer_claim, :with_transfer_detail) }

      it 'factory builds claim without trial dates' 


      it 'should not require trial dates' 

    end
    context 'case type: retrial' do
      let(:claim) { build(:transfer_claim, :with_transfer_detail) }

      it 'factory builds claim without trial dates' 


      it 'should not require retrial dates' 

    end
  end

  context 'case type validation' do
     let(:claim) { build(:transfer_claim, :with_transfer_detail) }

      it 'factory builds claim without case type' 


      it 'should not require case type' 

  end

  context 'case_conclusion' do

    let(:claim) { Claim::TransferClaim.new(litigator_type: 'new', elected_case: false, transfer_stage_id:30, case_conclusion_id: 10) }

    it 'is valid if a valid case conclusion id' 


    it 'errors if not a valid case conclusion id' 


    context 'presence and absence' do
      let(:claim) { Claim::TransferClaim.new(litigator_type: 'new', elected_case: false, transfer_stage_id: 50, case_conclusion_id: 10) }

      it 'should error if absent but required' 

      it 'should error if present but not required' 

    end
  end

  context 'transfer_details combination' do

    let(:claim) { Claim::TransferClaim.new(litigator_type: 'new', elected_case: false, transfer_stage_id: 50, case_conclusion_id: 10) }

    it 'adds a transfer detail combination error for invalid combinations' 


    it 'adds a specifc error on case conclusion id for invalid combinations to help resolve them' 


    it 'does not error if details are a valid combo' 

  end
end

