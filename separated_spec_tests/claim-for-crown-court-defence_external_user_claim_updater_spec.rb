require 'rails_helper'

module Claims
  describe ExternalUserClaimUpdater do
    let(:current_user) { double(User, id: 12345) }

    subject { described_class.new(claim, current_user: current_user) }

    describe '#delete' do
      let(:claim) { create :advocate_claim }

      it 'soft-deletes the claim' 

    end

    describe '#archive' do
      let(:claim) { create :rejected_claim }

      after(:each) do
        expect(claim.last_state_transition.author_id).to eq(current_user.id)
      end

      it 'archives the claim' 

    end

    describe '#request_redetermination' do
      let(:claim) { create :part_authorised_claim }

      after(:each) do
        expect(claim.last_state_transition.author_id).to eq(current_user.id)
      end

      it 'sends a redetermination request' 

    end

    describe '#request_written_reasons' do
      let(:claim) { create :part_authorised_claim }

      after(:each) do
        expect(claim.last_state_transition.author_id).to eq(current_user.id)
      end

      it 'sends a request for reasons' 

    end

    describe '#submit' do
      let(:claim) { create :advocate_claim }

      after(:each) do
        expect(claim.last_state_transition.author_id).to eq(current_user.id)
      end

      it 'submits the claim' 

    end

    describe '#clone_rejected' do
      let(:claim) { create :rejected_claim }

      it 'clones the claim' 


      it 'saves audit attributes in the new draft' 


      context 'when the claim is not rejected' do
        let(:claim) { create :submitted_claim }

        it 'raises an appropriate error' 

      end
    end
  end
end

