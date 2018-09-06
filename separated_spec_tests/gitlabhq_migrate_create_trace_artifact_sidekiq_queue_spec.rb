require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180306074045_migrate_create_trace_artifact_sidekiq_queue.rb')

describe MigrateCreateTraceArtifactSidekiqQueue, :sidekiq, :redis do
  include Gitlab::Database::MigrationHelpers

  context 'when there are jobs in the queues' do
    it 'correctly migrates queue when migrating up' 


    it 'does not affect other queues under the same namespace' 


    it 'correctly migrates queue when migrating down' 

  end

  context 'when there are no jobs in the queues' do
    it 'does not raise error when migrating up' 


    it 'does not raise error when migrating down' 

  end

  def stubbed_worker(queue:)
    Class.new do
      include Sidekiq::Worker
      sidekiq_options queue: queue
    end
  end
end

