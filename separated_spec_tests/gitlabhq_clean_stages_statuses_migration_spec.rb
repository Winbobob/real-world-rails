require 'spec_helper'
require Rails.root.join('db', 'migrate', '20170912113435_clean_stages_statuses_migration.rb')

describe CleanStagesStatusesMigration, :migration, :sidekiq, :redis do
  let(:migration) { spy('migration') }

  before do
    allow(Gitlab::BackgroundMigration::MigrateStageStatus)
      .to receive(:new).and_return(migration)
  end

  context 'when there are pending background migrations' do
    it 'processes pending jobs synchronously' 

  end

  context 'when there are no background migrations pending' do
    it 'does nothing' 

  end

  context 'when there are still unmigrated stages afterwards' do
    let(:stages) { table('ci_stages') }

    before do
      stages.create!(status: nil, name: 'build')
      stages.create!(status: nil, name: 'test')
    end

    it 'migrates statuses sequentially in batches' 

  end
end

