require 'rails_helper'

RSpec.describe API::Entities::CCLF::AdaptedInterimFee, type: :adapter do
  subject(:response) { JSON.parse(described_class.represent(interim_fee).to_json, symbolize_names: true) }

  let(:claim) { instance_double(::Claim::InterimClaim) }
  let(:fee_type) { instance_double(::Fee::InterimFeeType, unique_code: 'INTDT') }
  let(:interim_fee) do
    instance_double(
      ::Fee::InterimFee,
      claim: claim,
      fee_type: fee_type,
      quantity: 0.0,
      amount: 0.0,
      warrant_issued_date: nil,
      warrant_executed_date: nil,
      is_interim_warrant?: false
    )
  end

  it_behaves_like 'a bill types delegator', ::CCLF::Fee::InterimFeeAdapter do
    let(:bill) { interim_fee }
  end

  it 'formats amount as string' 


  it 'formats quantity as string integer' 


  context 'interim warrants' do
    let(:fee_type) { instance_double(::Fee::InterimFeeType, unique_code: 'INWAR') }

    before do
      allow(interim_fee).to receive_messages(
          amount: 101.01,
          warrant_issued_date: '01-Jun-2017'.to_date,
          warrant_executed_date: '01-Aug-2017'.to_date,
          is_interim_warrant?: true
        )
    end

    it 'exposes expected json key-value pairs' 

  end

  context 'effective pcmh' do
    let(:fee_type) { instance_double(::Fee::InterimFeeType, unique_code: 'INPCM') }

    before do
      allow(interim_fee).to receive_messages(quantity: 999.0, amount: 202.02)
    end

    it 'exposes expected json key-value pairs' 


    it 'does not expose warrant attributes' 

  end
end

