require 'spec_helper'

describe Memberships::UpdateBookedAt do
  let(:membership) { create :membership }
  subject { described_class.new(membership).call }

  describe '#call' do
    context 'booked has changed' do
      context 'to false' do
        before do
          membership.booked = false
        end

        it 'changes booked_at to nil' 

      end

      context 'to true' do
        before do
          membership.booked = true
        end

        it 'changes booked_at to starts_at date' 

      end
    end

    context 'booked has not changed' do
      it 'does not change booked_at' 

    end
  end
end

