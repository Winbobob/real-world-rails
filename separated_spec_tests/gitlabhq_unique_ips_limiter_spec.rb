require 'spec_helper'

describe Gitlab::Auth::UniqueIpsLimiter, :clean_gitlab_redis_shared_state do
  include_context 'unique ips sign in limit'
  let(:user) { create(:user) }

  describe '#count_unique_ips' do
    context 'non unique IPs' do
      it 'properly counts them' 

    end

    context 'unique IPs' do
      it 'properly counts them' 

    end

    it 'resets count after specified time window' 

  end

  describe '#limit_user!' do
    include_examples 'user login operation with unique ip limit' do
      def operation
        described_class.limit_user! { user }
      end
    end

    context 'allow 2 unique ips' do
      before do
        Gitlab::CurrentSettings.current_application_settings.update!(unique_ips_limit_per_user: 2)
      end

      it 'blocks user trying to login from third ip' 

    end
  end
end

