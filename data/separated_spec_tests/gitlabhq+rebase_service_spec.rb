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
    project.add_maintainer(user)
  end

  describe '#execute' do
    context 'when another rebase is already in progress' do
      before do
        allow(merge_request).to receive(:rebase_in_progress?).and_return(true)
      end

      it 'saves the error message' 


      it 'returns an error' 

    end

    context 'when unexpected error occurs' do
      before do
        allow(repository).to receive(:gitaly_operation_client).and_raise('Something went wrong')
      end

      it 'saves a generic error message' 


      it 'returns an error' 

    end

    context 'with git command failure' do
      before do
        allow(repository).to receive(:gitaly_operation_client).and_raise(Gitlab::Git::Repository::GitError, 'Something went wrong')
      end

      it 'saves a generic error message' 


      it 'returns an error' 

    end

    context 'valid params' do
      describe 'successful rebase' do
        before do
          service.execute(merge_request)
        end

        it 'rebases source branch' 


        it 'records the new SHA on the merge request' 


        it 'logs correct author and committer' 

      end

      context 'fork' do
        describe 'successful fork rebase' do
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
      end
    end
  end
end

