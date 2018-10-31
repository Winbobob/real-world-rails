require 'rails_helper'

describe API::Entities::CCR::AdaptedBasicFee, type: :adapter do
  subject(:response) { JSON.parse(described_class.represent(adapted_basic_fees).to_json).deep_symbolize_keys }

  let(:claim) { create(:authorised_claim, case_type: case_type) }
  let(:case_type) { build(:case_type, :trial) }
  let(:adapted_basic_fees) { ::CCR::Fee::BasicFeeAdapter.new(claim) }

  it 'exposes expected json key-value pairs' 


  it 'does not expose unneccesary fee attributes' 

end

