require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180420010616_cleanup_build_stage_migration.rb')

describe CleanupBuildStageMigration, :migration, :sidekiq, :redis do
  let(:migration) { spy('migration') }

  before do
    allow(Gitlab::BackgroundMigration::MigrateBuildStage)
      .to receive(:new).and_return(migration)
  end

  context 'when there are pending background migrations' do
    it 'processes pending jobs synchronously' 

  end

  context 'when there are no background migrations pending' do
    it 'does nothing' 

  end

  context 'when there are still unmigrated builds present' do
    let(:builds) { table('ci_builds') }

    before do
      builds.create!(name: 'test:1', ref: 'master')
      builds.create!(name: 'test:2', ref: 'master')
    end

    it 'migrates stages sequentially in batches' 

  end
end

