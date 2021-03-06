require 'rails_helper'

describe API::Entities::CCR::AdaptedMiscFee, type: :adapter do
  subject(:response) { JSON.parse(described_class.represent(adapted_misc_fee).to_json).deep_symbolize_keys }

  let(:claim) { create(:advocate_claim) }

  let(:misc_fee) do
    create(:misc_fee, :mispf_fee, :with_date_attended,
      claim: claim,
      quantity: 1.1,
      rate: 25
    )
  end
  let(:adapted_misc_fee) { ::CCR::Fee::MiscFeeAdapter.new.call(misc_fee) }

  it 'exposes expected json key-value pairs' 


  it 'exposes dates attended in JSON compatible format' 


  context '#number_of_defendants' do
    subject { response[:number_of_defendants] }

    let(:miaph) { create(:misc_fee_type, :miaph) }
    let(:miahu) { create(:misc_fee_type, :miahu) }
    let(:misc_fee) { claim.misc_fees.find_by(fee_type_id: miaph.id) }
    let(:adapted_misc_fee) { ::CCR::Fee::MiscFeeAdapter.new.call(misc_fee) }

    before do
      create(:misc_fee, :with_date_attended, fee_type: miaph, claim: claim, quantity: 1, rate: 25)
    end

    context 'when matching misc fee (defendant) uplift NOT claimed' do
      it 'returns 1 for the main defendant' 

    end

    context 'when 1 matching misc fee (defendant) uplift claimed' do
      before do
        create(:misc_fee, fee_type: miahu, claim: claim, quantity: 2, amount: 21.01)
      end

      it 'returns sum of (defendant) uplift quantity plus one for the main defendant' 

    end

    context 'when more than 1 matching misc fee (defendant) uplift claimed' do
      before do
        create_list(:misc_fee, 2, fee_type: miahu, claim: claim, quantity: 2, amount: 21.01)
      end

      it 'returns sum of all (defendant) uplift quantities plus one for the main defendant' 

    end
  end
end

