require 'spec_helper'

describe BackgroundMigrationWorker, :sidekiq, :clean_gitlab_redis_shared_state do
  let(:worker) { described_class.new }

  describe '.minimum_interval' do
    it 'returns 2 minutes' 

  end

  describe '.perform' do
    it 'performs a background migration' 


    it 'reschedules a migration if it was performed recently' 


    it 'reschedules a migration if the database is not healthy' 

  end

  describe '#healthy_database?' do
    context 'using MySQL', :mysql do
      it 'returns true' 

    end

    context 'using PostgreSQL', :postgresql do
      context 'when replication lag is too great' do
        it 'returns false' 

      end

      context 'when replication lag is small enough' do
        it 'returns true' 

      end
    end
  end
end

