require 'rails_helper'

describe Claims::CreateClaim do
  after(:all) do
    clean_database
  end

  let(:claim) { FactoryBot.build :advocate_claim, uuid: SecureRandom.uuid }
  subject { described_class.new(claim) }

  describe '#action' do
    it 'returns :new' 

  end

  describe '#draft?' do
    it 'returns false' 

  end

  describe '#call' do

    before { expect(subject.claim.persisted?).to be_falsey }

    context 'with a valid Claim' do
      before { expect(subject.claim).to receive(:update_claim_document_owners) }

      it 'forces validation' 


      it 'returns success' 


      after { expect(subject.claim.persisted?).to be_truthy }
    end

    context 'with an invalid Claim' do
      before do
        subject.claim.case_number = nil
        expect(subject.claim).not_to receive(:update_claim_document_owners)
      end

      it 'returns an error' 


      after { expect(subject.claim.persisted?).to be_falsey }
    end

    context 'with an already submitted Claim' do
      before do
        allow(subject).to receive(:already_submitted?).and_return(true)
        expect(subject.claim).not_to receive(:update_claim_document_owners)
      end

      it 'returns an error' 


      after { expect(subject.claim.persisted?).to be_falsey }
    end
  end
end

