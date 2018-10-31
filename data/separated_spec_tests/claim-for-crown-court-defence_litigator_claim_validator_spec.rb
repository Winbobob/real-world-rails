require 'rails_helper'
require_relative 'shared_examples_for_advocate_litigator'
require_relative 'shared_examples_for_step_validators'

RSpec.describe Claim::LitigatorClaimValidator, type: :validator do
  include_context "force-validation"

  let(:litigator) { build(:external_user, :litigator) }
  let(:claim) { create(:litigator_claim) }

  include_examples "common advocate litigator validations", :litigator
  include_examples "common litigator validations"

  include_examples 'common partial validations', [
    %i[
      case_type
      court
      case_number
      case_transferred_from_another_court
      transfer_court
      transfer_case_number
      case_concluded_at
    ],
    [],
    %i[offence],
    %i[actual_trial_length],
    %i[defendant_uplifts],
    %i[total]
  ]

  describe '#validate_defendant_uplifts' do
    let(:claim) { create(:litigator_claim, :without_fees) }
    let(:miupl) { create(:misc_fee_type, :miupl) }

    before do
      create(:misc_fee, fee_type: miupl, claim: claim, quantity: 0, amount: 250.01)
      claim.reload
      claim.form_step = :miscellaneous_fees
    end

    it 'test setup' 


    context 'with 1 defendant' do
      context 'when there are 0 defendant uplift fees' do
        before { claim.misc_fees.delete_all }

        it 'test setup' 


        it 'should not error' 

      end

      context 'when there is 1 defendant uplift fee' do
        it 'test setup' 


        it 'should error' 


        context 'when from api' do
          before do
            allow(claim).to receive(:from_api?).and_return true
          end

         it 'should not error' 
        it 'test setup' 


        it 'should not error' 

      end

      context 'when there are multiple defendant uplifts (2 or more), per fee type' do
        before do
          create_list(:misc_fee, 2, fee_type: miupl, claim: claim, quantity: 0, amount: 21.01)
        end

        it 'test setup' 


        it 'should add one error only' 

      end
    end

    context 'defendant uplifts fee marked for destruction' do
      it 'test setup' 


      it 'are ignored' 

    end

    context 'defendants marked for destruction' do
      before do
        create(:defendant, claim: claim)
      end

      it 'test setup' 


      it 'are ignored' 

    end
  end
end

