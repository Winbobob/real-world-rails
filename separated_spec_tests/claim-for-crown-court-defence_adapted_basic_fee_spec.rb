require 'rails_helper'

describe API::Entities::CCR::AdaptedBasicFee, type: :adapter do
  subject(:response) { JSON.parse(described_class.represent(adapted_basic_fees).to_json).deep_symbolize_keys }

  let(:claim) { create(:authorised_claim) }
  let(:case_type) { instance_double('case_type', fee_type_code: 'GRTRL', requires_retrial_dates?: false) }
  let(:adapted_basic_fees) { ::CCR::Fee::BasicFeeAdapter.new(claim) }

  before do
    allow(claim).to receive(:case_type).and_return case_type
  end

  it 'exposes expected json key-value pairs' 


  it 'does not expose unneccesary fee attributes' 

end

