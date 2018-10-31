require 'spec_helper'

describe Users::ActivityService do
  include ExclusiveLeaseHelpers

  let(:user) { create(:user, last_activity_on: last_activity_on) }

  subject { described_class.new(user, 'type') }

  describe '#execute', :clean_gitlab_redis_shared_state do
    context 'when last activity is nil' do
      let(:last_activity_on) { nil }

      it 'updates last_activity_on for the user' 

    end

    context 'when last activity is in the past' do
      let(:last_activity_on) { Date.today - 1.week }

      it 'updates last_activity_on for the user' 

    end

    context 'when a bad object is passed' do
      let(:fake_object) { double(username: 'hello') }

      it 'does not record activity' 

    end

    context 'when last activity is today' do
      let(:last_activity_on) { Date.today }

      it 'does not update last_activity_on' 

    end

    context 'when in GitLab read-only instance' do
      let(:last_activity_on) { nil }

      before do
        allow(Gitlab::Database).to receive(:read_only?).and_return(true)
      end

      it 'does not update last_activity_on' 

    end

    context 'when a lease could not be obtained' do
      let(:last_activity_on) { nil }

      it 'does not update last_activity_on' 

    end
  end
end

