require 'rails_helper'

RSpec.describe API::Entities::CCLF::AdaptedGraduatedFee, type: :adapter do
  subject(:response) { JSON.parse(described_class.represent(graduated_fee).to_json, symbolize_names: true) }

  let(:fee_type) { instance_double('fee_type', unique_code: 'GRTRL') }
  let(:case_type) { instance_double('case_type', fee_type_code: 'GRTRL') }
  let(:claim) { instance_double('claim', case_type: case_type) }
  let(:graduated_fee) { instance_double('graduated_fee', claim: claim, fee_type: fee_type, quantity: 999.0) }

  it_behaves_like 'a bill types delegator', ::CCLF::Fee::GraduatedFeeAdapter do
    let(:bill) { graduated_fee }
  end

  it 'exposes expected json key-value pairs' 

end

