require 'rake_helper'

describe 'gitlab:cleanup rake tasks' do
  before do
    Rake.application.rake_require 'tasks/gitlab/cleanup'
  end

  describe 'cleanup' do
    let(:storages) do
      {
        'default' => Gitlab::GitalyClient::StorageSettings.new(@default_storage_hash.merge('path' => 'tmp/tests/default_storage'))
      }
    end

    before(:all) do
      @default_storage_hash = Gitlab.config.repositories.storages.default.to_h
    end

    before do
      FileUtils.mkdir(Settings.absolute('tmp/tests/default_storage'))
      allow(Gitlab.config.repositories).to receive(:storages).and_return(storages)
    end

    after do
      FileUtils.rm_rf(Settings.absolute('tmp/tests/default_storage'))
    end

    describe 'cleanup:repos' do
      before do
        FileUtils.mkdir_p(Settings.absolute('tmp/tests/default_storage/broken/project.git'))
        FileUtils.mkdir_p(Settings.absolute('tmp/tests/default_storage/@hashed/12/34/5678.git'))
      end

      it 'moves it to an orphaned path' 


      it 'ignores @hashed repos' 

    end

    describe 'cleanup:dirs' do
      it 'removes missing namespaces' 


      it 'ignores @hashed directory' 

    end
  end
end

