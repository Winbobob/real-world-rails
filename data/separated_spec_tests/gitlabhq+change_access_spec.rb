require 'spec_helper'

describe Gitlab::Checks::ChangeAccess do
  describe '#exec' do
    let(:user) { create(:user) }
    let(:project) { create(:project, :repository) }
    let(:user_access) { Gitlab::UserAccess.new(user, project: project) }
    let(:oldrev) { 'be93687618e4b132087f430a4d8fc3a609c9b77c' }
    let(:newrev) { '54fcc214b94e78d7a41a9a8fe6d87a5e59500e51' }
    let(:ref) { 'refs/heads/master' }
    let(:changes) { { oldrev: oldrev, newrev: newrev, ref: ref } }
    let(:protocol) { 'ssh' }
    let(:timeout) { Gitlab::GitAccess::INTERNAL_TIMEOUT }
    let(:logger) { Gitlab::Checks::TimedLogger.new(timeout: timeout) }

    subject(:change_access) do
      described_class.new(
        changes,
        project: project,
        user_access: user_access,
        protocol: protocol,
        logger: logger
      )
    end

    before do
      project.add_developer(user)
    end

    context 'without failed checks' do
      it "doesn't raise an error" 

    end

    context 'when time limit was reached' do
      it 'raises a TimeoutError' 

    end

    context 'when the user is not allowed to push to the repo' do
      it 'raises an error' 

    end

    context 'tags check' do
      let(:ref) { 'refs/tags/v1.0.0' }

      it 'raises an error if the user is not allowed to update tags' 


      context 'with protected tag' do
        let!(:protected_tag) { create(:protected_tag, project: project, name: 'v*') }

        context 'as maintainer' do
          before do
            project.add_maintainer(user)
          end

          context 'deletion' do
            let(:oldrev) { 'be93687618e4b132087f430a4d8fc3a609c9b77c' }
            let(:newrev) { '0000000000000000000000000000000000000000' }

            it 'is prevented' 

          end

          context 'update' do
            let(:oldrev) { 'be93687618e4b132087f430a4d8fc3a609c9b77c' }
            let(:newrev) { '54fcc214b94e78d7a41a9a8fe6d87a5e59500e51' }

            it 'is prevented' 

          end
        end

        context 'creation' do
          let(:oldrev) { '0000000000000000000000000000000000000000' }
          let(:newrev) { '54fcc214b94e78d7a41a9a8fe6d87a5e59500e51' }
          let(:ref) { 'refs/tags/v9.1.0' }

          it 'prevents creation below access level' 


          context 'when user has access' do
            let!(:protected_tag) { create(:protected_tag, :developers_can_create, project: project, name: 'v*') }

            it 'allows tag creation' 

          end
        end
      end
    end

    context 'branches check' do
      context 'trying to delete the default branch' do
        let(:newrev) { '0000000000000000000000000000000000000000' }
        let(:ref) { 'refs/heads/master' }

        it 'raises an error' 

      end

      context 'protected branches check' do
        before do
          allow(ProtectedBranch).to receive(:protected?).with(project, 'master').and_return(true)
          allow(ProtectedBranch).to receive(:protected?).with(project, 'feature').and_return(true)
        end

        it 'raises an error if the user is not allowed to do forced pushes to protected branches' 


        it 'raises an error if the user is not allowed to merge to protected branches' 


        it 'raises an error if the user is not allowed to push to protected branches' 


        context 'when project repository is empty' do
          let(:project) { create(:project) }

          it 'raises an error if the user is not allowed to push to protected branches' 

        end

        context 'branch deletion' do
          let(:newrev) { '0000000000000000000000000000000000000000' }
          let(:ref) { 'refs/heads/feature' }

          context 'if the user is not allowed to delete protected branches' do
            it 'raises an error' 

          end

          context 'if the user is allowed to delete protected branches' do
            before do
              project.add_maintainer(user)
            end

            context 'through the web interface' do
              let(:protocol) { 'web' }

              it 'allows branch deletion' 

            end

            context 'over SSH or HTTP' do
              it 'raises an error' 

            end
          end
        end
      end
    end

    context 'LFS integrity check' do
      it 'fails if any LFS blobs are missing' 


      it 'succeeds if LFS objects have already been uploaded' 

    end

    context 'LFS file lock check' do
      let(:owner) { create(:user) }
      let!(:lock) { create(:lfs_file_lock, user: owner, project: project, path: 'README') }

      before do
        allow(project.repository).to receive(:new_commits).and_return(
          project.repository.commits_between('be93687618e4b132087f430a4d8fc3a609c9b77c', '54fcc214b94e78d7a41a9a8fe6d87a5e59500e51')
        )
      end

      context 'with LFS not enabled' do
        it 'skips the validation' 

      end

      context 'with LFS enabled' do
        before do
          allow(project).to receive(:lfs_enabled?).and_return(true)
        end

        context 'when change is sent by a different user' do
          it 'raises an error if the user is not allowed to update the file' 

        end

        context 'when change is sent by the author of the lock' do
          let(:user) { owner }

          it "doesn't raise any error" 

        end
      end
    end
  end
end

