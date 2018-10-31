require 'rake_helper'

describe 'gitlab:cleanup rake tasks' do
  before do
    Rake.application.rake_require 'tasks/gitlab/cleanup'
  end

  describe 'cleanup namespaces and repos' do
    let(:gitlab_shell) { Gitlab::Shell.new }
    let(:storage) { storages.keys.first }
    let(:storages) do
      {
        'default' => Gitlab::GitalyClient::StorageSettings.new(@default_storage_hash.merge('path' => 'tmp/tests/default_storage'))
      }
    end

    before(:all) do
      @default_storage_hash = Gitlab.config.repositories.storages.default.to_h
    end

    before do
      allow(Gitlab.config.repositories).to receive(:storages).and_return(storages)
    end

    after do
      Gitlab::GitalyClient::StorageService.new(storage).delete_all_repositories
    end

    describe 'cleanup:repos' do
      before do
        gitlab_shell.add_namespace(storage, 'broken/project.git')
        gitlab_shell.add_namespace(storage, '@hashed/12/34/5678.git')
      end

      it 'moves it to an orphaned path' 


      it 'ignores @hashed repos' 

    end

    describe 'cleanup:dirs' do
      it 'removes missing namespaces' 


      it 'ignores @hashed directory' 

    end
  end

  # A single integration test that is redundant with one part of the
  # Gitlab::Cleanup::ProjectUploads spec.
  #
  # Additionally, this tests DRY_RUN env var values, and the extra line of
  # output that says you can disable DRY_RUN if it's enabled.
  describe 'cleanup:project_uploads' do
    let!(:logger) { double(:logger) }

    before do
      expect(main_object).to receive(:logger).and_return(logger).at_least(1).times

      allow(logger).to receive(:info).at_least(1).times
      allow(logger).to receive(:debug).at_least(1).times
    end

    context 'with a fixable orphaned project upload file' do
      let(:orphaned) { create(:upload, :issuable_upload, :with_file, model: build(:project, :legacy_storage)) }
      let(:new_path) { orphaned.absolute_path }
      let(:path) { File.join(FileUploader.root, 'some', 'wrong', 'location', orphaned.path) }

      before do
        FileUtils.mkdir_p(File.dirname(path))
        FileUtils.mv(new_path, path)
      end

      context 'with DRY_RUN disabled' do
        before do
          stub_env('DRY_RUN', 'false')
        end

        it 'moves the file to its proper location' 


        it 'logs action as done' 

      end

      shared_examples_for 'does not move the file' do
        it 'does not move the file' 


        it 'logs action as able to be done' 

      end

      context 'with DRY_RUN explicitly enabled' do
        before do
          stub_env('DRY_RUN', 'true')
        end

        it_behaves_like 'does not move the file'
      end

      context 'with DRY_RUN set to an unknown value' do
        before do
          stub_env('DRY_RUN', 'foo')
        end

        it_behaves_like 'does not move the file'
      end

      context 'with DRY_RUN unset' do
        it_behaves_like 'does not move the file'
      end
    end
  end
end

