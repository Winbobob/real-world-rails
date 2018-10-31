require 'spec_helper'

describe MergeRequests::RebaseService do
  include ProjectForksHelper

  let(:user) { create(:user) }
  let(:merge_request) do
    create(:merge_request,
           source_branch: 'feature_conflict',
           target_branch: 'master')
  end
  let(:project) { merge_request.project }
  let(:repository) { project.repository.raw }

  subject(:service) { described_class.new(project, user, {}) }

  before do
    project.add_master(user)
  end

  describe '#execute' do
    context 'when another rebase is already in progress' do
      before do
        allow(merge_request).to receive(:rebase_in_progress?).and_return(true)
      end

      it 'saves the error message' 


      it 'returns an error' 

    end

    context 'when unexpected error occurs', :disable_gitaly do
      before do
        allow(repository).to receive(:run_git!).and_raise('Something went wrong')
      end

      it 'saves a generic error message' 


      it 'returns an error' 

    end

    context 'with git command failure', :disable_gitaly do
      before do
        allow(repository).to receive(:run_git!).and_raise(Gitlab::Git::Repository::GitError, 'Something went wrong')
      end

      it 'saves a generic error message' 


      it 'returns an error' 

    end

    context 'valid params' do
      shared_examples 'successful rebase' do
        before do
          service.execute(merge_request)
        end

        it 'rebases source branch' 


        it 'records the new SHA on the merge request' 


        it 'logs correct author and commiter' 

      end

      context 'when Gitaly rebase feature is enabled' do
        it_behaves_like 'successful rebase'
      end

      context 'when Gitaly rebase feature is disabled', :disable_gitaly do
        it_behaves_like 'successful rebase'
      end

      context 'git commands', :disable_gitaly do
        it 'sets GL_REPOSITORY env variable when calling git commands' 

      end

      context 'fork' do
        shared_examples 'successful fork rebase' do
          let(:forked_project) do
            fork_project(project, user, repository: true)
          end

          let(:merge_request_from_fork) do
            forked_project.repository.create_file(
              user,
              'new-file-to-target',
              '',
              message: 'Add new file to target',
              branch_name: 'master')

            create(:merge_request,
                  source_branch: 'master', source_project: forked_project,
                  target_branch: 'master', target_project: project)
          end

          it 'rebases source branch' 

        end

        context 'when Gitaly rebase feature is enabled' do
          it_behaves_like 'successful fork rebase'
        end

        context 'when Gitaly rebase feature is disabled', :disable_gitaly do
          it_behaves_like 'successful fork rebase'
        end
      end
    end
  end
end

