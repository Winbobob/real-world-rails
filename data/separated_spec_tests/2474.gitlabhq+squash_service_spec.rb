require 'spec_helper'

describe MergeRequests::SquashService do
  include GitHelpers

  let(:service) { described_class.new(project, user, {}) }
  let(:user) { project.owner }
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository.raw }
  let(:log_error) { "Failed to squash merge request #{merge_request.to_reference(full: true)}:" }
  let(:squash_dir_path) do
    File.join(Gitlab.config.shared.path, 'tmp/squash', repository.gl_repository, merge_request.id.to_s)
  end
  let(:merge_request_with_one_commit) do
    create(:merge_request,
           source_branch: 'feature', source_project: project,
           target_branch: 'master', target_project: project)
  end

  let(:merge_request_with_only_new_files) do
    create(:merge_request,
           source_branch: 'video', source_project: project,
           target_branch: 'master', target_project: project)
  end

  let(:merge_request_with_large_files) do
    create(:merge_request,
           source_branch: 'squash-large-files', source_project: project,
           target_branch: 'master', target_project: project)
  end

  shared_examples 'the squash succeeds' do
    it 'returns the squashed commit SHA' 


    it 'cleans up the temporary directory' 


    it 'does not keep the branch push event' 


    context 'the squashed commit' do
      let(:squash_sha) { service.execute(merge_request)[:squash_sha] }
      let(:squash_commit) { project.repository.commit(squash_sha) }

      it 'copies the author info and message from the merge request' 


      it 'sets the current user as the committer' 


      it 'has the same diff as the merge request, but a different SHA' 

    end
  end

  describe '#execute' do
    context 'when there is only one commit in the merge request' do
      it 'returns that commit SHA' 


      it 'does not perform any git actions' 

    end

    context 'when squashing only new files' do
      let(:merge_request) { merge_request_with_only_new_files }

      include_examples 'the squash succeeds'
    end

    context 'when squashing with files too large to display' do
      let(:merge_request) { merge_request_with_large_files }

      include_examples 'the squash succeeds'
    end

    context 'git errors' do
      let(:merge_request) { merge_request_with_only_new_files }
      let(:error) { 'A test error' }

      context 'with gitaly enabled' do
        before do
          allow(repository.gitaly_operation_client).to receive(:user_squash)
            .and_raise(Gitlab::Git::Repository::GitError, error)
        end

        it 'logs the stage and output' 


        it 'returns an error' 

      end
    end

    context 'when any other exception is thrown' do
      let(:merge_request) { merge_request_with_only_new_files }
      let(:error) { 'A test error' }

      before do
        allow(merge_request).to receive(:commits_count).and_raise(error)
      end

      it 'logs the MR reference and exception' 


      it 'returns an error' 


      it 'cleans up the temporary directory' 

    end
  end
end

