require 'spec_helper'

describe Gitlab::SidekiqThrottler do
  describe '#execute!' do
    context 'when job throttling is enabled' do
      before do
        Sidekiq.options[:concurrency] = 35

        stub_application_setting(
          sidekiq_throttling_enabled: true,
          sidekiq_throttling_factor: 0.1,
          sidekiq_throttling_queues: %w[build project_cache]
        )
      end

      it 'requires sidekiq-limit_fetch' 


      it 'sets limits on the selected queues' 


      it 'does not set limits on other queues' 

    end

    context 'when job throttling is disabled' do
      it 'does not require sidekiq-limit_fetch' 

    end
  end
end

