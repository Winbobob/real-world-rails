require 'rails_helper'
require_relative 'shared_examples_for_advocate_litigator'
require_relative 'shared_examples_for_step_validators'

RSpec.describe Claim::AdvocateClaimValidator, type: :validator do
  include_context "force-validation"

  let(:litigator) { create(:external_user, :litigator) }
  let(:claim)     { create(:advocate_claim) }

  include_examples "common advocate litigator validations", :advocate

  context 'case concluded at date' do
    let(:claim) { build(:claim) }

    it 'is valid when absent' 


    it 'is invalid when present' 

  end

  context 'external_user' do
    it 'should error when does not have advocate role' 


    it 'should error if not present, regardless' 


    it 'should error if does not belong to the same provider as the creator' 

  end

  context 'creator' do
    before { claim.creator = litigator }

    it 'should error when their provider does not have AGFS role' 


    context 'when validation has been overridden' do
      before { claim.disable_for_state_transition = :all }

      it { expect(claim.valid?).to be true }
    end
  end

  context 'supplier_number' do
    # NOTE: In reality supplier number is derived from external_user which in turn is validated in any event
    let(:advocate)  { build(:external_user, :advocate, supplier_number: '9G606X') }
    it 'should error when the supplier number does not match pattern' 

  end

  context 'advocate_category' do
    before do
      claim.form_step = 'basic_and_fixed_fees'
    end

    it 'should error if not present' 


    it 'should error if not in the available list' 


    default_valid_categories = ['QC', 'Led junior', 'Leading junior', 'Junior alone']

    context 'when on fee reform scheme' do
      before do
        allow(claim).to receive(:fee_scheme).and_return('fee_reform')
      end

      fee_reform_valid_categories = ['QC', 'Leading junior', 'Junior']
      fee_reform_invalid_categories = ['Led junior', 'Junior alone']

      fee_reform_valid_categories.each do |valid_entry|
        it "should not error if '#{valid_entry}' specified" 

      end

      fee_reform_invalid_categories.each do |valid_entry|
        it "should not error if '#{valid_entry}' specified" 

      end
    end

    default_valid_categories.each do |valid_entry|
      it "should not error if '#{valid_entry}' specified" 

    end
  end

  context 'offence' do
    before do
      claim.form_step = :offence_details
      claim.offence = nil
    end

    it 'should error if not present for non-fixed fee case types' 


    it 'should NOT error if not present for fixed fee case types' 


    context 'when the claim is associated with the new fee reform scheme' do
      before do
        allow(claim).to receive(:fee_scheme).and_return('fee_reform')
      end

      context 'and case type is for non-fixed fees' do
        before do
          allow(claim.case_type).to receive(:is_fixed_fee?).and_return(false)
        end

        it 'should error if not present' 

      end

      context 'and case type is for fixed fees' do
        before do
          allow(claim.case_type).to receive(:is_fixed_fee?).and_return(true)
        end

        it 'should NOT error if not present' 

      end
    end
  end

  context 'defendant uplift fees aggregation validation' do
    let(:miaph) { create(:misc_fee_type, :miaph) }
    let(:miahu) { create(:misc_fee_type, :miahu) }
    let(:midtw) { create(:misc_fee_type, :midtw) }
    let(:midwu) { create(:misc_fee_type, :midwu) }
    let(:misc_fee) { claim.misc_fees.find_by(fee_type_id: miaph.id) }

    before do
      claim.misc_fees.delete_all
      create(:misc_fee, fee_type: miaph, claim: claim, quantity: 1, rate: 25.1)
      claim.reload
      claim.form_step = :miscellaneous_fees
    end

    it 'test setup' 


    context 'with 1 defendant' do
      context 'when there are 0 uplifts' do
        it 'test setup' 


        it 'should not error' 

      end

      context 'when there is 1 miscellanoues fee uplift' do
        before do
          create(:misc_fee, fee_type: miahu, claim: claim, quantity: 1, amount: 21.01)
        end

        it 'test setup' 


        it 'should error' 


        context 'when from api' do
          before do
            allow(claim).to receive(:from_api?).and_return true
          end

          it 'should not error' 

        end
      end

      context 'when there is 1 basic fee uplift' do
        before do
          create(:basic_fee, :ndr_fee, claim: claim, quantity: 1, amount: 21.01)
        end

        it 'test setup' 


        it 'should error' 

      end

      context 'with 2 defendants' do
        before do
          create(:defendant, claim: claim)
          create(:misc_fee, fee_type: midtw, claim: claim, quantity: 1, amount: 21.01)
        end

        context 'when there are multiple uplifts of 1 per fee type' do
          before do
            create(:misc_fee, fee_type: miahu, claim: claim, quantity: 1, amount: 21.01)
            create(:misc_fee, fee_type: midwu, claim: claim, quantity: 1, amount: 21.01)
          end

          it 'test setup' 


          it 'should not error' 

        end

        context 'when there are multiple uplifts of 2 (or more) per fee type' do
          before do
            create(:misc_fee, fee_type: miahu, claim: claim, quantity: 2, amount: 21.01)
            create(:misc_fee, fee_type: midwu, claim: claim, quantity: 2, amount: 21.01)
          end

          it 'test setup' 


          it 'should add one error only' 

        end
      end

      context 'defendant uplifts fee marked for destruction' do
        before do
          create(:misc_fee, fee_type: miahu, claim: claim, quantity: 1, amount: 21.01)
        end

        it 'test setup' 


        it 'are ignored' 

      end

      context 'defendants marked for destruction' do
        before do
          create(:defendant, claim: claim)
          create(:misc_fee, fee_type: miahu, claim: claim, quantity: 1, amount: 21.01)
        end

        it 'test setup' 


        it 'are ignored' 

      end
    end
  end

  include_examples 'common partial validations', [
      %i[
          case_type
          court
          case_number
          case_transferred_from_another_court
          transfer_court
          transfer_case_number
          estimated_trial_length
          actual_trial_length
          retrial_estimated_length
          retrial_actual_length
          trial_cracked_at_third
          trial_fixed_notice_at
          trial_fixed_at
          trial_cracked_at
          trial_dates
          retrial_started_at
          retrial_concluded_at
          case_concluded_at
          supplier_number
      ],
      [],
      %i[offence],
      %i[total advocate_category defendant_uplifts],
      %i[total],
      %i[total],
      [],
      []
  ]
end
