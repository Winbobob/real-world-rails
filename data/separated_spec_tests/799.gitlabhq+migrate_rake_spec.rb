require 'rake_helper'

describe 'gitlab:lfs namespace rake task' do
  before :all do
    Rake.application.rake_require 'tasks/gitlab/lfs/migrate'
  end

  describe 'migrate' do
    let(:local) { ObjectStorage::Store::LOCAL }
    let(:remote) { ObjectStorage::Store::REMOTE }
    let!(:lfs_object) { create(:lfs_object, :with_file, file_store: local) }

    def lfs_migrate
      run_rake_task('gitlab:lfs:migrate')
    end

    context 'object storage disabled' do
      before do
        stub_lfs_object_storage(enabled: false)
      end

      it "doesn't migrate files" 

    end

    context 'object storage enabled' do
      before do
        stub_lfs_object_storage
      end

      it 'migrates local file to object storage' 

    end
  end
end
