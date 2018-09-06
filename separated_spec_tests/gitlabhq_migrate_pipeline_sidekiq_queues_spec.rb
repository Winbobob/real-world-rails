require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170822101017_migrate_pipeline_sidekiq_queues.rb')

describe MigratePipelineSidekiqQueues, :sidekiq, :redis do
  include Gitlab::Database::MigrationHelpers

  context 'when there are jobs in the queues' do
    it 'correctly migrates queue when migrating up' 


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

