require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180603190921_migrate_object_storage_upload_sidekiq_queue.rb')

describe MigrateObjectStorageUploadSidekiqQueue, :sidekiq, :redis do
  include Gitlab::Database::MigrationHelpers

  context 'when there are jobs in the queue' do
    it 'correctly migrates queue when migrating up' 

  end

  context 'when there are no jobs in the queues' do
    it 'does not raise error when migrating up' 

  end

  def stubbed_worker(queue:)
    Class.new do
      include Sidekiq::Worker
      sidekiq_options queue: queue
    end
  end
end

