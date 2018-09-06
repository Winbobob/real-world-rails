require 'rails_helper'

RSpec.describe ClaimStateTransitionPresenter do
  subject(:presenter) { described_class.new(transition, view) }
  let(:claim) { create(:allocated_claim) }
  let(:transition) { claim.last_state_transition }
  let(:current_user) { create(:user, first_name: 'Brielle', last_name: 'Jenkins') }
  let(:another_user) { create(:user, first_name: 'Madyson', last_name: 'Gibson') }

  describe '#transition_message' do
    subject { presenter.transition_message }

    before(:each) do
      allow(presenter).to receive(:current_user_persona).and_return('CaseWorker')
    end

    it 'returns a human readable string describing a state change' 

  end

  describe '#audit_users' do
    subject { presenter.audit_users }
    let(:is_external_user) { false }
    let(:claim) { create(:submitted_claim) }

    before(:each) do
      allow(view).to receive(:current_user_is_external_user?).and_return(is_external_user)
    end

    context 'without an author user' do
      it 'returns a default string' 

    end

    context 'with an author user when logged in as an external user' do
      let(:is_external_user) { true }
      let(:claim) { create(:rejected_claim) }

      before(:each) do
        allow(view).to receive(:current_user).and_return(current_user)
      end

      context 'and the transition was triggered by the same user' do
        before(:each) do
          claim.archive_pending_delete!(author_id: current_user.id)
        end

        it 'returns a default string' 

      end

      context 'and the transition was triggered by a different user' do
        before(:each) do
          claim.archive_pending_delete!(author_id: another_user.id)
        end

        it 'returns a default string' 

      end
    end

    context 'with an author user but without a subject user' do
      let(:claim) { create(:rejected_claim) }

      before(:each) do
        claim.archive_pending_delete!(author_id: current_user.id)
      end

      it 'returns a human readable string describing who did the change' 

    end

    context 'with a subject user' do
      let(:claim) { create(:submitted_claim) }

      before(:each) do
        claim.allocate!(author_id: current_user.id, subject_id: another_user.id)
      end

      it 'returns a human readable string describing who did the change and to whom' 

    end
  end

  describe '#reason_header' do
    subject { presenter.reason_header }
    let(:claim) { create(:rejected_claim) }

    context '1 reason' do
      before do
        allow(transition).to receive(:reason_code).and_return(['wrong_maat_ref'])
      end

      it 'returns a human readable string header' 

    end

    context '2+ reasons' do
      before do
        allow(transition).to receive(:reason_code).and_return(['wrong_maat_ref', 'other'])
      end

      it 'returns a human readable string header' 

    end
  end

  describe '#reason_descriptions' do
    subject { presenter.reason_descriptions }
    let(:claim) { create(:rejected_claim) }

    context '2+ reasons (including other)' do
      before do
        allow(transition).to receive(:reason_code).and_return(['wrong_maat_ref','other'])
        allow(transition).to receive(:reason_text).and_return('rejecting because...')
      end

      it 'yields a human readable reason description for each reason' 


      it 'returns array containing the human readable reasons' 

    end
  end
end

