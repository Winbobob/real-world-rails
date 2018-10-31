require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180216121030_enqueue_verify_pages_domain_workers')

describe EnqueueVerifyPagesDomainWorkers, :sidekiq, :migration do
  around do |example|
    Sidekiq::Testing.fake! do
      example.run
    end
  end

  describe '#up' do
    it 'enqueues a verification worker for every domain' 

  end
end

