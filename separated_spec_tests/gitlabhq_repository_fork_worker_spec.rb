require 'spec_helper'

describe RepositoryForkWorker do
  describe 'modules' do
    it 'includes ProjectImportOptions' 

  end

  describe "#perform" do
    let(:project) { create(:project, :repository) }
    let(:shell) { Gitlab::Shell.new }
    let(:fork_project) { create(:project, :repository, :import_scheduled, forked_from_project: project) }

    shared_examples 'RepositoryForkWorker performing' do
      before do
        allow(subject).to receive(:gitlab_shell).and_return(shell)
      end

      def expect_fork_repository
        expect(shell).to receive(:fork_repository).with(
          'default',
          project.disk_path,
          fork_project.repository_storage,
          fork_project.disk_path
        )
      end

      describe 'when a worker was reset without cleanup' do
        let(:jid) { '12345678' }

        it 'creates a new repository from a fork' 

      end

      it "creates a new repository from a fork" 


      it 'protects the default branch' 


      it 'flushes various caches' 


      it "handles bad fork" 

    end

    context 'only project ID passed' do
      def perform!
        subject.perform(fork_project.id)
      end

      it_behaves_like 'RepositoryForkWorker performing'
    end

    context 'project ID, storage and repo paths passed' do
      def perform!
        subject.perform(fork_project.id, TestEnv.repos_path, project.disk_path)
      end

      it_behaves_like 'RepositoryForkWorker performing'

      it 'logs a message about forking with old-style arguments' 

    end
  end
end

