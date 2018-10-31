require 'spec_helper'

describe Gitlab::ExclusiveLeaseHelpers, :clean_gitlab_redis_shared_state do
  include ::ExclusiveLeaseHelpers

  let(:class_instance) { (Class.new { include ::Gitlab::ExclusiveLeaseHelpers }).new }
  let(:unique_key) { SecureRandom.hex(10) }

  describe '#in_lock' do
    subject { class_instance.in_lock(unique_key, **options) { } }

    let(:options) { {} }

    context 'when the lease is not obtained yet' do
      before do
        stub_exclusive_lease(unique_key, 'uuid')
      end

      it 'calls the given block' 


      it 'calls the given block continuously' 


      it 'cancels the exclusive lease after the block' 

    end

    context 'when the lease is obtained already' do
      let!(:lease) { stub_exclusive_lease_taken(unique_key) }

      it 'retries to obtain a lease and raises an error' 


      context 'when ttl is specified' do
        let(:options) { { ttl: 10.minutes } }

        it 'receives the specified argument' 

      end

      context 'when retry count is specified' do
        let(:options) { { retries: 3 } }

        it 'retries for the specified times' 

      end

      context 'when sleep second is specified' do
        let(:options) { { retries: 0, sleep_sec: 0.05.seconds } }

        it 'receives the specified argument' 

      end
    end
  end
end

