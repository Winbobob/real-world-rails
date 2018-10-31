require 'spec_helper'

describe Gitlab::ExclusiveLease, :clean_gitlab_redis_shared_state do
  let(:unique_key) { SecureRandom.hex(10) }

  describe '#try_obtain' do
    it 'cannot obtain twice before the lease has expired' 


    it 'can obtain after the lease has expired' 

  end

  describe '#renew' do
    it 'returns true when we have the existing lease' 


    it 'returns false when we dont have a lease' 

  end

  describe '#exists?' do
    it 'returns true for an existing lease' 


    it 'returns false for a lease that does not exist' 

  end

  describe '.get_uuid' do
    it 'gets the uuid if lease with the key associated exists' 


    it 'returns false if the lease does not exist' 

  end

  describe '.cancel' do
    it 'can cancel a lease' 


    def new_lease(key)
      described_class.new(key, timeout: 3600).try_obtain
    end
  end

  describe '#ttl' do
    it 'returns the TTL of the Redis key' 


    it 'returns nil when the lease does not exist' 

  end

  describe '.reset_all!' do
    it 'removes all existing lease keys from redis' 

  end
end

