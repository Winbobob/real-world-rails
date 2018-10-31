require 'spec_helper'
require 'rake'

describe 'gitlab:app namespace rake task' do
  let(:enable_registry) { true }

  def tars_glob
    Dir.glob(File.join(Gitlab.config.backup.path, '*_gitlab_backup.tar'))
  end

  def backup_tar
    tars_glob.first
  end

  before(:all) do
    Rake.application.rake_require 'tasks/gitlab/helpers'
    Rake.application.rake_require 'tasks/gitlab/backup'
    Rake.application.rake_require 'tasks/gitlab/shell'
    Rake.application.rake_require 'tasks/gitlab/db'
    Rake.application.rake_require 'tasks/cache'

    # empty task as env is already loaded
    Rake::Task.define_task :environment

    # We need this directory to run `gitlab:backup:create` task
    FileUtils.mkdir_p('public/uploads')
  end

  before do
    stub_env('force', 'yes')
    FileUtils.rm(tars_glob, force: true)
    reenable_backup_sub_tasks
    stub_container_registry_config(enabled: enable_registry)
  end

  after do
    FileUtils.rm(tars_glob, force: true)
  end

  def run_rake_task(task_name)
    Rake::Task[task_name].reenable
    Rake.application.invoke_task task_name
  end

  def reenable_backup_sub_tasks
    %w{db repo uploads builds artifacts pages lfs registry}.each do |subtask|
      Rake::Task["gitlab:backup:#{subtask}:create"].reenable
    end
  end

  describe 'backup_restore' do
    context 'gitlab version' do
      before do
        allow(Dir).to receive(:glob).and_return(['1_gitlab_backup.tar'])
        allow(File).to receive(:exist?).and_return(true)
        allow(Kernel).to receive(:system).and_return(true)
        allow(FileUtils).to receive(:cp_r).and_return(true)
        allow(FileUtils).to receive(:mv).and_return(true)
        allow(Rake::Task["gitlab:shell:setup"])
          .to receive(:invoke).and_return(true)
      end

      let(:gitlab_version) { Gitlab::VERSION }

      it 'fails on mismatch' 


      it 'invokes restoration on match' 

    end

    context 'when the restore directory is not empty' do
      before do
        # We only need a backup of the repositories for this test
        stub_env('SKIP', 'db,uploads,builds,artifacts,lfs,registry')
      end

      it 'removes stale data' 

    end
  end # backup_restore task

  describe 'backup' do
    before do
      # This reconnect makes our project fixture disappear, breaking the restore. Stub it out.
      allow(ActiveRecord::Base.connection).to receive(:reconnect!)
    end

    describe 'backup creation and deletion using custom_hooks' do
      let(:project) { create(:project, :repository) }
      let(:user_backup_path) { "repositories/#{project.disk_path}" }

      before do
        stub_env('SKIP', 'db')
        path = Gitlab::GitalyClient::StorageSettings.allow_disk_access do
          File.join(project.repository.path_to_repo, 'custom_hooks')
        end
        FileUtils.mkdir_p(path)
        FileUtils.touch(File.join(path, "dummy.txt"))
      end

      context 'project uses custom_hooks and successfully creates backup' do
        it 'creates custom_hooks.tar and project bundle' 


        it 'restores files correctly' 

      end

      context 'specific backup tasks' do
        let(:task_list) { %w(db repo uploads builds artifacts pages lfs registry) }

        it 'prints a progress message to stdout' 

      end
    end

    context 'tar creation' do
      context 'archive file permissions' do
        it 'sets correct permissions on the tar file' 


        context 'with custom archive_permissions' do
          before do
            allow(Gitlab.config.backup).to receive(:archive_permissions).and_return(0651)
          end

          it 'uses the custom permissions' 

        end
      end

      it 'sets correct permissions on the tar contents' 


      it 'deletes temp directories' 


      context 'registry disabled' do
        let(:enable_registry) { false }

        it 'does not create registry.tar.gz' 

      end
    end

    context 'multiple repository storages' do
      let(:test_second_storage) do
        Gitlab::GitalyClient::StorageSettings.new(@default_storage_hash.merge('path' => 'tmp/tests/custom_storage'))
      end
      let(:storages) do
        {
          'default' => Gitlab.config.repositories.storages.default,
          'test_second_storage' => test_second_storage
        }
      end

      before(:all) do
        @default_storage_hash = Gitlab.config.repositories.storages.default.to_h
      end

      before do
        # We only need a backup of the repositories for this test
        stub_env('SKIP', 'db,uploads,builds,artifacts,lfs,registry')

        allow(Gitlab.config.repositories).to receive(:storages).and_return(storages)

        # Avoid asking gitaly about the root ref (which will fail beacuse of the
        # mocked storages)
        allow_any_instance_of(Repository).to receive(:empty?).and_return(false)
      end

      after do
        FileUtils.rm_rf(Settings.absolute('tmp/tests/custom_storage'))
      end

      it 'includes repositories in all repository storages' 

    end
  end # backup_create task

  describe "Skipping items" do
    before do
      stub_env('SKIP', 'repositories,uploads')
    end

    it "does not contain skipped item" 


    it 'does not invoke repositories restore' 

  end

  describe "Human Readable Backup Name" do
    it 'name has human readable time' 

  end
end # gitlab:app namespace

