require 'rails_helper'

RSpec.describe ClaimCsvPresenter do

  let(:claim)               { create(:redetermination_claim) }
  let(:subject)             { ClaimCsvPresenter.new(claim, view) }

  context '#present!' do

    context 'generates a line of CSV for each time a claim passes through the system' do

      context 'with identical values for' do

        it 'case_number' 


        it 'supplier number' 


        it 'organisation/provider_name' 


        it 'case_type' 


        context 'AGFS' do
          it 'scheme' 

        end

        context 'AGFS' do
          it 'scheme' 

        end

        context 'LGFS' do
          it 'scheme' 

        end

        it 'total (inc VAT)' 


        it 'disc evidence' 

      end

      describe 'disc evidence' do
        subject { ClaimCsvPresenter.new(claim, view).disk_evidence_case }

        context 'when the applicant has checked disc_evidence' do
          let(:claim) { create :advocate_claim, disk_evidence: true }

          it { is_expected.to eq 'Yes' }
        end

        context 'when the applicant has not checked disc_evidence' do
          let(:claim) { create :advocate_claim }

          it { is_expected.to eq 'No' }
        end
      end

      describe 'caseworker name' do
        context 'decision transition doesnt exist' do
          it 'returns nil' 

        end

        context 'author_id on the decision transition is nil' do
          it 'returns nil' 

        end

        context 'a decided claim' do
          it 'returns name of the caseworker that made the decision' 

        end

        context 'an allocated claim' do
          it 'returns the name of the caseworker allocated to the claim' 

        end

      end

      context 'and unique values for' do
        before { Timecop.freeze(Time.now) }
        after  { Timecop.return }

        it 'submission type' 


        it 'date submitted' 


        it 'date allocated' 


        it 'date of last assessment' 


        it 'current/end state' 

      end

      context 'deallocation' do
        let(:claim) { create(:allocated_claim) }

        before {
          case_worker = claim.case_workers.first
          claim.deallocate!
          claim.case_workers << case_worker
          claim.reload.deallocate!
        }

        it 'should not be reflected in the MI' 


        it 'and the claim should be refelcted as being in the state prior to allocation' 

      end

      context 'state transitions reasons' do
        let(:claim) { create(:allocated_claim) }

        context 'rejected with a single reason as a string ' do
          before do
            claim.reject!(reason_code: ['no_rep_order'])
          end

          it 'the rejection reason code should be reflected in the MI' 

        end

        context 'rejected with a single reason' do
          before do
            claim.reject!(reason_code: ['no_rep_order'])
          end

          it 'the rejection reason code should be reflected in the MI' 

        end

        context 'rejected with a multiple reasons' do
          before do
            claim.reject!(reason_code: ['no_rep_order', 'wrong_case_no'])
          end

          it 'the rejection reason code should be reflected in the MI' 

        end

        context 'rejected with other' do
          before do
            claim.reject!(reason_code: ['other'], reason_text: 'Rejection reason')
          end

          it 'the rejection reason code should be reflected in the MI' 

        end

        context 'refused with a single reason as a string ' do
          before do
            claim.refuse!(reason_code: ['no_rep_order'])
          end

          it 'the refusal reason code should be reflected in the MI' 

        end

        context 'refused with a single reason' do
          before do
            claim.refuse!(reason_code: ['no_rep_order'])
          end

          it 'the refusal reason code should be reflected in the MI' 

        end

        context 'refused with multiple reasons' do
          before do
            claim.refuse!(reason_code: ['no_rep_order', 'wrong_case_no'])
          end

          it 'the refusal reason code should be reflected in the MI' 

        end

        context 'rejected with other' do
          before do
            claim.reject!(reason_code: ['other'], reason_text: 'Rejection reason')
          end

          it 'the rejection reason code should be reflected in the MI' 

        end
      end
    end
  end
end

