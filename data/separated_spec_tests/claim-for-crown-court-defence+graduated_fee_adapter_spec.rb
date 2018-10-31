require 'rails_helper'
require_relative 'shared_examples_for_cclf_fee_adapters'

RSpec.describe CCLF::Fee::GraduatedFeeAdapter, type: :adapter do
  it_behaves_like 'Litigator Fee Adapter', graduated_fee_bill_scenarios
  it_behaves_like 'a simple bill adapter', bill_type: 'LIT_FEE', bill_subtype: 'LIT_FEE' do
    let(:fee) { instance_double(Fee::GraduatedFee) }
  end
end

