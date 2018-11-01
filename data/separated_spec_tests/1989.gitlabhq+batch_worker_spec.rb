require 'spec_helper'

describe RepositoryCheck::BatchWorker do
  let(:shard_name) { 'default' }
  subject { described_class.new }

  before do
    Gitlab::ShardHealthCache.update([shard_name])
  end

  it 'prefers projects that have never been checked' 


  it 'sorts projects by last_repository_check_at' 


  it 'excludes projects that were checked recently' 


  it 'excludes projects on another shard' 


  it 'does nothing when repository checks are disabled' 


  it 'does nothing when shard is unhealthy' 


  it 'skips projects created less than 24 hours ago' 


  it 'does not run if the exclusive lease is taken' 

end

