require 'rails_helper'

describe API::Entities::BaseFeeType do
  subject(:response) { JSON.parse(described_class.represent(fee_type).to_json).deep_symbolize_keys }
  let(:fee_type) { build(:basic_fee_type) }

  it 'exposes all model attributes' 


  it 'exposes #case_uplift? as case_numbers_required attribute' 

end

