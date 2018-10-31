require 'spec_helper'

describe Gitlab::Git::Storage::CircuitBreaker, :broken_storage do
  let(:storage_name) { 'default' }
  let(:circuit_breaker) { described_class.new(storage_name, hostname) }
  let(:hostname) { Gitlab::Environment.hostname }
  let(:cache_key) { "storage_accessible:#{storage_name}:#{hostname}" }

  def set_in_redis(name, value)
    Gitlab::Git::Storage.redis.with do |redis|
      redis.zadd(Gitlab::Git::Storage::REDIS_KNOWN_KEYS, 0, cache_key)
      redis.hmset(cache_key, name, value)
    end.first
  end

  before do
    # Override test-settings for the circuitbreaker with something more realistic
    # for these specs.
    stub_storage_settings('default' => {
                            'path' => TestEnv.repos_path
                          },
                          'broken' => {
                            'path' => 'tmp/tests/non-existent-repositories'
                          },
                          'nopath' => { 'path' => nil }
                         )
  end

  describe '.for_storage', :request_store do
    it 'only builds a single circuitbreaker per storage' 


    it 'returns a broken circuit breaker for an unknown storage' 


    it 'returns a broken circuit breaker when the path is not set' 

  end

  describe '#initialize' do
    it 'assigns the settings' 

  end

  context 'circuitbreaker settings' do
    before do
      stub_application_setting(circuitbreaker_failure_count_threshold: 0,
                               circuitbreaker_failure_wait_time: 1,
                               circuitbreaker_failure_reset_time: 2,
                               circuitbreaker_storage_timeout: 3,
                               circuitbreaker_access_retries: 4,
                               circuitbreaker_backoff_threshold: 5)
    end

    describe '#failure_count_threshold' do
      it 'reads the value from settings' 

    end

    describe '#check_interval' do
      it 'reads the value from settings' 

    end

    describe '#failure_reset_time' do
      it 'reads the value from settings' 

    end

    describe '#storage_timeout' do
      it 'reads the value from settings' 

    end

    describe '#access_retries' do
      it 'reads the value from settings' 

    end
  end

  describe '#perform' do
    it 'raises the correct exception when the circuit is open' 


    it 'yields the block' 


    it 'checks if the storage is available' 


    it 'returns the value of the block' 


    it 'raises possible errors' 


    context 'with the feature disabled' do
      before do
        stub_feature_flags(git_storage_circuit_breaker: false)
      end

      it 'returns the block without checking accessibility' 


      it 'allows enabling the feature using an ENV var' 

    end
  end

  describe '#circuit_broken?' do
    it 'is working when there is no last failure' 


    it 'is broken when there are too many failures' 

  end

  describe '#last_failure' do
    it 'returns the last failure time' 

  end

  describe '#failure_count' do
    it 'returns the failure count' 

  end
end

