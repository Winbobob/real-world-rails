require 'rails_helper'

describe API::Entities::CCLF::CaseType do
  subject(:response) { JSON.parse(described_class.represent(claim).to_json).deep_symbolize_keys }
  let(:case_type) { build(:case_type, :trial) }

  context 'delegation' do
    let(:claim) { instance_double(::Claim::LitigatorClaim, case_type: case_type, interim?: false, transfer?: false) }
    let(:adapter_klass) { ::CCLF::CaseTypeAdapter }
    let(:adapter) { instance_double(adapter_klass) }

    it "delegates bill_scenario to adapter" 

  end

  context 'for final claims' do
    let(:claim) { instance_double(::Claim::LitigatorClaim, case_type: case_type, interim?: false, transfer?: false) }

    it 'exposes expected bill scenario' 

  end

  context 'for interim claims with an interim fee other than warrant or disbursement only' do
    let(:fee) { build(:interim_fee, :effective_pcmh) }
    let(:claim) { instance_double(::Claim::InterimClaim, case_type: case_type, interim?: true, transfer?: false, interim_fee: fee) }

    it 'exposes expected bill scenario' 

  end

  context 'for transfer claims' do
    let(:claim) { instance_double(::Claim::TransferClaim, case_type: case_type, interim?: false, transfer?: true, transfer_detail: transfer_detail) }
    let(:transfer_detail) { build(:transfer_detail, :with_specific_mapping) }

    it 'response has expected bill scenario' 

  end
end

