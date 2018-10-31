require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180604123514_cleanup_stages_position_migration.rb')

describe CleanupStagesPositionMigration, :migration, :sidekiq, :redis do
  let(:migration) { spy('migration') }

  before do
    allow(Gitlab::BackgroundMigration::MigrateStageIndex)
      .to receive(:new).and_return(migration)
  end

  context 'when there are pending background migrations' do
    it 'processes pending jobs synchronously' 

  end

  context 'when there are no background migrations pending' do
    it 'does nothing' 

  end

  context 'when there are still unmigrated stages present' do
    let(:stages) { table('ci_stages') }
    let(:builds) { table('ci_builds') }

    let!(:entities) do
      %w[build test broken].map do |name|
        stages.create(name: name)
      end
    end

    before do
      stages.update_all(position: nil)

      builds.create(name: 'unit', stage_id: entities.first.id, stage_idx: 1, ref: 'master')
      builds.create(name: 'unit', stage_id: entities.second.id, stage_idx: 1, ref: 'master')
    end

    it 'migrates stages sequentially for every stage' 

  end
end

