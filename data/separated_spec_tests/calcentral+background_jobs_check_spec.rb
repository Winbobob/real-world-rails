describe BackgroundJobsCheck do
  before do
    allow(Settings.cache).to receive(:servers).and_return(cache_servers)
    allow(ServerRuntime).to receive(:get_settings).and_return({'hostname' => hostname})
    allow(DateTime).to receive(:now).and_return(fake_now)
  end
  let(:cache_servers) { ['dev-01', 'dev-02', 'dev-03'] }
  let(:hostname) { 'dev-03' }
  let(:fake_now) { Time.zone.parse('2014-09-22 06:00').to_time }

  describe '#current_node_id' do
    context 'when more than one cache server is configured' do
      it 'uses hostname as the node ID' 

    end
    context 'when only one cache server is configured' do
      let(:cache_servers) { ['localhost'] }
      it 'assumes that is the node ID' 

    end
  end

  describe '#check_in' do
    it 'writes timestamp to cache' 

    context 'when node ID does not match cache servers configuration' do
      let(:hostname) { 'some-random-ip' }
      it 'reports an error but does not write the timestamp' 

    end
  end

  describe '#get_feed' do
    before do
      allow(Settings.background_jobs_check).to receive(:time_between_pings).and_return(10.minutes)
      allow(Rails.cache).to receive(:read) do |key|
        cache_hash[key]
      end
      allow(Messaging).to receive(:publish).with('/topics/background_jobs_check', {})
    end
    let(:success_cache_hash) do
      {
        'BackgroundJobsCheck/cluster' => ping_time,
        'BackgroundJobsCheck/dev-01' => ping_time,
        'BackgroundJobsCheck/dev-02' => ping_time,
        'BackgroundJobsCheck/dev-03' => ping_time
      }
    end
    let(:ping_time) { fake_now.advance(minutes: -1) }
    context 'the last check was handled by all nodes within a reasonable time' do
      let(:cache_hash) { success_cache_hash }
      it 'reports success' 

    end
    context 'a node is missing its most recent check but within the normal lag range' do
      let(:cache_hash) { success_cache_hash.merge('BackgroundJobsCheck/dev-03' => ping_time.advance(minutes: -10)) }
      it 'reports success' 

    end
    context 'a node recorded its most recent check longer ago than expected' do
      let(:ping_time) { fake_now.advance(minutes: -4) }
      let(:cache_hash) { success_cache_hash.merge('BackgroundJobsCheck/dev-03' => ping_time.advance(minutes: -10)) }
      it 'reports a late node' 

    end
    context 'a node recorded its most recent check much longer ago than expected' do
      let(:cache_hash) { success_cache_hash.merge('BackgroundJobsCheck/dev-03' => ping_time.advance(minutes: -30)) }
      it 'reports a dead node' 

    end
    context 'a node has not recorded any checks' do
      let(:cache_hash) { success_cache_hash.merge('BackgroundJobsCheck/dev-03' => nil) }
      it 'reports a missing node' 

    end
    context 'no checks have been done yet' do
      let(:cache_hash) { {} }
      it 'reports that we have not started' 

    end
    context 'no checks requested for a long while' do
      let(:ping_time) {fake_now.advance(hours: -1) }
      let(:cache_hash) { success_cache_hash }
      it 'reports an error' 

    end

  end

end

