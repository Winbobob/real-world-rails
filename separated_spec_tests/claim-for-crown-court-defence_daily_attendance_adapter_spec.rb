require 'rails_helper'

RSpec.describe CCR::DailyAttendanceAdapter, type: :adapter do
  subject { described_class.new(claim) }
  let(:claim) { create(:authorised_claim) }

  describe '#attendances' do
    subject { described_class.new(claim).attendances }

    context 'for trials' do
      context 'when no daily attendance uplift fees applied' do
        [0,1,3,nil].each do |trial_length|
          context "and claim has an actual trial length of #{trial_length || 'nil'}" do
            before { claim.update(actual_trial_length: trial_length) }
            it "returns #{[trial_length,2].compact.min} - as least of actual trial length or 2 (included in basic fee)" 

          end
        end
      end

      context 'for retrials' do
        let(:retrial) { create(:case_type, :retrial) }

        before do
          claim.update(case_type: retrial)
        end

        context 'when no daily attendance uplift fees applied' do
          [0,1,3,nil].each do |trial_length|
            context "and claim has an actual retrial length of #{trial_length || 'nil'}" do
              before { claim.update(retrial_actual_length: trial_length) }
              it "returns #{[trial_length,2].compact.min} - as least of actual retrial length or 2 (included in basic fee)" 

            end
          end
        end
      end
    end

    context 'when daily attendance uplift fees applied' do
      before do
        claim.actual_trial_length = 51
        create(:basic_fee, :daf_fee, claim: claim, quantity: 38, rate: 1.0)
        create(:basic_fee, :dah_fee, claim: claim, quantity: 10, rate: 1.0)
        create(:basic_fee, :daj_fee, claim: claim, quantity: 1, rate: 1.0)
      end

      it 'returns sum of daily attendance fee types plus 2 (included in basic fee)' 

    end
  end

  describe '.attendances_for' do
    subject { described_class.attendances_for(claim) }
    let(:adapter) { instance_double 'DailyAttendanceAdapter' }

    it 'calls #attendances' 

  end
end
