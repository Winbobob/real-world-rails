require 'rake_helper'

describe 'gitlab:storage rake tasks' do
  before do
    Rake.application.rake_require 'tasks/gitlab/storage'

    stub_warn_user_is_not_gitlab
  end

  describe 'migrate_to_hashed rake task' do
    context '0 legacy projects' do
      it 'does nothing' 

    end

    context '5 legacy projects' do
      let(:projects) { create_list(:project, 5, storage_version: 0) }

      context 'in batches of 1' do
        before do
          stub_env('BATCH' => 1)
        end

        it 'enqueues one StorageMigratorWorker per project' 

      end

      context 'in batches of 2' do
        before do
          stub_env('BATCH' => 2)
        end

        it 'enqueues one StorageMigratorWorker per 2 projects' 

      end
    end
  end
end

