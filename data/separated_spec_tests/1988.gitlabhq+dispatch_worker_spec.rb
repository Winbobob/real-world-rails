require 'spec_helper'

describe RepositoryCheck::DispatchWorker do
  subject { described_class.new }

  it 'does nothing when repository checks are disabled' 


  it 'does nothing if the exclusive lease is taken' 


  it 'dispatches work to RepositoryCheck::BatchWorker' 


  context 'with unhealthy shard' do
    let(:default_shard_name) { 'default' }
    let(:unhealthy_shard_name) { 'unhealthy' }
    let(:default_shard) { Gitlab::HealthChecks::Result.new(true, nil, shard: default_shard_name) }
    let(:unhealthy_shard) { Gitlab::HealthChecks::Result.new(false, '14:Connect Failed', shard: unhealthy_shard_name) }

    before do
      allow(Gitlab::HealthChecks::GitalyCheck).to receive(:readiness).and_return([default_shard, unhealthy_shard])
    end

    it 'only triggers RepositoryCheck::BatchWorker for healthy shards' 

  end
end

