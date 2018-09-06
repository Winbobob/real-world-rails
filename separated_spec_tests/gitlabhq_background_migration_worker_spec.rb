require 'spec_helper'

describe BackgroundMigrationWorker, :sidekiq, :clean_gitlab_redis_shared_state do
  let(:worker) { described_class.new }

  describe '.perform' do
    it 'performs a background migration' 


    it 'reschedules a migration if it was performed recently' 

  end
end

