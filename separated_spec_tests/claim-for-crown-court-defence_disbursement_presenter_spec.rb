require 'rails_helper'

RSpec.describe DisbursementPresenter do

  let(:claim) { instance_double(Claim::LitigatorClaim) }
  let(:disbursement_type) { instance_double(DisbursementType, name: 'name') }
  let(:disbursement) { instance_double(Disbursement, disbursement_type: disbursement_type, claim: claim, net_amount: 1.456, vat_amount: 2.343) }

  subject { described_class.new(disbursement, view) }

  describe '#name' do
    it 'returns the disbursement type name' 


    context 'when disbursement type was not specified' do
      let(:disbursement_type) { nil }

      it 'returns a placeholder text' 

    end
  end

  describe '#net_amount' do
    it 'returns the net_amount rounded and formatted' 

  end

  describe '#vat_amount' do
    it 'returns the vat_amount rounded and formatted' 

  end
end

