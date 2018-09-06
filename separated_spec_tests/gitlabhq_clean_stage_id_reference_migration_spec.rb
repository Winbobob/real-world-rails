require 'spec_helper'
require Rails.root.join('db', 'migrate', '20170710083355_clean_stage_id_reference_migration.rb')

describe CleanStageIdReferenceMigration, :migration, :sidekiq, :redis do
  let(:migration_class) { 'MigrateBuildStageIdReference' }
  let(:migration) { spy('migration') }

  before do
    allow(Gitlab::BackgroundMigration.const_get(migration_class))
      .to receive(:new).and_return(migration)
  end

  context 'when there are pending background migrations' do
    it 'processes pending jobs synchronously' 

  end
  context 'when there are no background migrations pending' do
    it 'does nothing' 

  end
end

