require 'rails_helper'

RSpec.describe Claim::TransferClaimPresenter do

  let(:claim) { instance_double(Claim::TransferClaim, transfer_detail: double) }
  let(:presenter) { Claim::TransferClaimPresenter.new(claim, view) }

  it { expect(presenter).to be_instance_of(Claim::TransferClaimPresenter) }
  it { expect(presenter).to be_kind_of(Claim::BaseClaimPresenter) }

  it 'should have expenses' 


  it 'should have disbursements' 


  let(:case_conclusions) do
    {
      '10' => 'Trial',
      '20' => 'Retrial',
      '30' => 'Cracked',
      '40' => 'Cracked before retrial',
      '50' => 'Guilty plea'
    }
  end

  context '#case_conclusions' do
    it 'returns a has of case conclusion descriptions and ids' 

  end

  context '#transfer_detail_summary' do
    context 'for transfer details NOT requiring a conclusion' do
      let(:claim) { create :transfer_claim, litigator_type: 'new', elected_case: true, transfer_stage_id: 10, case_conclusion_id: nil }
      it 'should return a string of expected values' 

    end

    context 'for transfer details NOT requiring a conclusion and from original litigator' do
      let(:claim) { create :transfer_claim, litigator_type: 'original', elected_case: false, transfer_stage_id: 40, case_conclusion_id: nil }
      it 'should return a string of expected values' 

    end

    context 'for transfer details requiring a conclusion' do
      let(:claim) { create :transfer_claim, litigator_type: 'new', elected_case: false, transfer_stage_id: 20, case_conclusion_id: 30 }
      it 'should return a string of expected values' 

    end

    context 'for incomplete transfer details' do
      let(:claim) { create :transfer_claim, litigator_type: nil, elected_case: nil, transfer_stage_id: nil, case_conclusion_id: nil }
      it 'should return blank string' 

    end
  end

  context 'descriptor methods' do
    let(:claim) { create :transfer_claim, litigator_type: 'new', elected_case: false, transfer_stage_id: 20, transfer_date: Date.parse('2015-05-21'), case_conclusion_id: 30 }
    it '#litigator_type_description' 

    it '#elected_case_description' 

    it '#transfer_stage_description' 

    it '#transfer_date' 

    it '#case_conclusion_description' 

  end

end

