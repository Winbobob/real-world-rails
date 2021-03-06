require 'rails_helper'

describe EvidenceCheckFlaggingService do
  let(:current_time) { Time.zone.now }
  let(:expires_in_days) { 2 }

  describe '#can_be_flagged?' do
    subject { described_class.new(application).can_be_flagged? }

    let(:application) { create :application_full_remission, reference: 'XY55-22-3', applicant: applicant }

    context 'when the applicant has no ni_number' do
      let(:applicant) { create :applicant_with_all_details, ni_number: nil }

      it { is_expected.to be false }
    end

    context 'when the applicant has an ni_number' do
      let(:applicant) { create :applicant_with_all_details }

      it { is_expected.to be true }
    end
  end

  describe '#process_flag' do
    subject(:process_flag) { described_class.new(evidence_check).process_flag }

    let(:application) { create :application_full_remission, reference: 'XY55-22-3', applicant: applicant }
    let(:applicant) { create :applicant_with_all_details }

    context 'when the evidence check passed' do
      let(:evidence_check) { create :evidence_check_full_outcome, :completed, application: application }

      context 'when a previous flag exists' do
        let!(:flag) { create :evidence_check_flag, ni_number: applicant.ni_number }

        it 'deactivates the flag' 

      end

      context 'when there is no flag' do
        it 'does not create a flag' 

      end
    end

    context 'when the evidence check failed' do
      let(:evidence_check) { create :evidence_check_incorrect, :completed, application: application }

      context 'when no flag exists' do
        it 'creates a new flag' 

      end

      context 'when a previous flag exists' do
        let!(:flag) { create :evidence_check_flag, ni_number: applicant.ni_number }

        it 'increments the count on the existing flag' 

      end
    end
  end
end

