require 'spec_helper'

describe Users::ActivityService do
  include UserActivitiesHelpers

  let(:user) { create(:user) }

  subject(:service) { described_class.new(user, 'type') }

  describe '#execute', :clean_gitlab_redis_shared_state do
    context 'when last activity is nil' do
      before do
        service.execute
      end

      it 'sets the last activity timestamp for the user' 


      it 'updates the same user' 


      it 'updates the timestamp of an existing user' 


      describe 'other user' do
        it 'updates other user' 

      end
    end

    context 'when in GitLab read-only instance' do
      before do
        allow(Gitlab::Database).to receive(:read_only?).and_return(true)
      end

      it 'does not update last_activity_at' 

    end
  end

  def last_hour_user_ids
    Gitlab::UserActivities.new
      .select { |k, v| v >= 1.hour.ago.to_i.to_s }
      .map { |k, _| k.to_i }
  end
end

