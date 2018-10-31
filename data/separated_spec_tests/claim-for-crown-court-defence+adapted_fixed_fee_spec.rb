require 'rails_helper'

describe API::Entities::CCR::AdaptedFixedFee, type: :adapter do
  subject(:response) { JSON.parse(described_class.represent(adapted_fixed_fees).to_json).deep_symbolize_keys }

  let(:claim) { create(:authorised_claim, case_number: 'T20160001') }
  let(:fxcbr) { create(:fixed_fee_type, :fxcbr) }
  let(:fxcbu) { create(:fixed_fee_type, :fxcbu) }
  let(:fxndr) { create(:fixed_fee_type, :fxndr) }
  let(:fxnoc) { create(:fixed_fee_type, :fxnoc) }

  let(:adapted_fixed_fees) { ::CCR::Fee::FixedFeeAdapter.new.call(claim) }

  context 'when an applicable fixed fee is claimed' do
    let(:case_type) { build(:case_type, :fixed_fee, fee_type_code: 'FXCBR', requires_maat_reference: false) }
    let(:claim) { create(:authorised_claim, case_number: 'T20160001', case_type: case_type) }

    before do |example|
      create(:fixed_fee, fee_type: fxcbr, claim: claim, quantity: 13) unless example.metadata[:skip_fee]
      create(:fixed_fee, fee_type: fxcbu, claim: claim, quantity: 2, case_numbers: 'T20170001,T20170002') unless example.metadata[:skip_uplifts]
    end

    it 'exposes expected json key-value pairs' 


    it 'does not expose unneccesary fee attributes' 


    context '#case_numbers (and #number_of_cases)' do
      subject { response[:case_numbers].split(',') }
      let(:number_of_cases) { response[:number_of_cases] }

      context 'when no case uplifts exist', :skip_uplifts do
        it 'returns 1 for number_of_cases' 

      end

      context 'when one or more case uplifts exist' do
        it 'includes additional case numbers for all uplift versions of the fixed fee type' 


        it 'includes additional case numbers for Number of cases uplift fixed fees' 


        it 'strips whitespace' 


        it 'excludes repeated additional case numbers' 

      end
    end

    context '#daily_attendances' do
      subject { response[:daily_attendances] }

      context 'when no fixed fee matching the case type exists' do
        it 'returns at least 1', :skip_fee do
          is_expected.to eql '1'
        end
      end

      context 'when one fixed fee matching the case type exists' do
        it 'returns fee quantity' 

      end

      context 'when more than one fixed fee matching the case type exists' do
        it 'returns sum of fee quantities' 

      end
    end

    context '#number_of_defendants' do
      subject { response[:number_of_defendants] }

      context 'when "Number of defendant uplifts" NOT claimed' do
        it 'returns 1 for the main defendant' 

      end

      context 'when "Number of defendant uplifts" claimed' do
        before do
          create_list(:fixed_fee, 2, fee_type: fxndr, claim: claim, quantity: 2)
        end

        it 'returns sum of all Number of defendants uplift quantities plus one for the main defendant' 

      end
    end
  end
end

