require 'spec_helper'

describe MergeRequests::RefreshService do
  include ProjectForksHelper

  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }
  let(:service) { described_class }

  describe '#execute' do
    before do
      @user = create(:user)
      group = create(:group)
      group.add_owner(@user)

      @project = create(:project, :repository, namespace: group)
      @fork_project = fork_project(@project, @user, repository: true)

      @merge_request = create(:merge_request,
                              source_project: @project,
                              source_branch: 'master',
                              target_branch: 'feature',
                              target_project: @project,
                              merge_when_pipeline_succeeds: true,
                              merge_user: @user)

      @another_merge_request = create(:merge_request,
                                      source_project: @project,
                                      source_branch: 'master',
                                      target_branch: 'test',
                                      target_project: @project,
                                      merge_when_pipeline_succeeds: true,
                                      merge_user: @user)

      @fork_merge_request = create(:merge_request,
                                   source_project: @fork_project,
                                   source_branch: 'master',
                                   target_branch: 'feature',
                                   target_project: @project)

      @build_failed_todo = create(:todo,
                                  :build_failed,
                                  user: @user,
                                  project: @project,
                                  target: @merge_request,
                                  author: @user)

      @fork_build_failed_todo = create(:todo,
                                       :build_failed,
                                       user: @user,
                                       project: @project,
                                       target: @merge_request,
                                       author: @user)

      @commits = @merge_request.commits

      @oldrev = @commits.last.id
      @newrev = @commits.first.id
    end

    context 'push to origin repo source branch' do
      let(:refresh_service) { service.new(@project, @user) }
      let(:notification_service) { spy('notification_service') }

      before do
        allow(refresh_service).to receive(:execute_hooks)
        allow(NotificationService).to receive(:new) { notification_service }
      end

      it 'executes hooks with update action' 


      it 'reloads source branch MRs memoization' 


      context 'when source branch ref does not exists' do
        before do
          DeleteBranchService.new(@project, @user).execute(@merge_request.source_branch)
        end

        it 'closes MRs without source branch ref' 


        it 'does not change the merge request diff' 

      end
    end

    context 'when pipeline exists for the source branch' do
      let!(:pipeline) { create(:ci_empty_pipeline, ref: @merge_request.source_branch, project: @project, sha: @commits.first.sha)}

      subject { service.new(@project, @user).execute(@oldrev, @newrev, 'refs/heads/master') }

      it 'updates the head_pipeline_id for @merge_request' 


      it 'does not update the head_pipeline_id for @fork_merge_request' 

    end

    context 'push to origin repo source branch when an MR was reopened' do
      let(:refresh_service) { service.new(@project, @user) }
      let(:notification_service) { spy('notification_service') }

      before do
        @merge_request.update(state: :reopened)

        allow(refresh_service).to receive(:execute_hooks)
        allow(NotificationService).to receive(:new) { notification_service }
        refresh_service.execute(@oldrev, @newrev, 'refs/heads/master')
        reload_mrs
      end

      it 'executes hooks with update action' 

    end

    context 'push to origin repo target branch' do
      context 'when all MRs to the target branch had diffs' do
        before do
          service.new(@project, @user).execute(@oldrev, @newrev, 'refs/heads/feature')
          reload_mrs
        end

        it 'updates the merge state' 

      end

      context 'when an MR to be closed was empty already' do
        let!(:empty_fork_merge_request) do
          create(:merge_request,
                 source_project: @fork_project,
                 source_branch: 'master',
                 target_branch: 'master',
                 target_project: @project)
        end

        before do
          # This spec already has a fake push, so pretend that we were targeting
          # feature all along.
          empty_fork_merge_request.update_columns(target_branch: 'feature')

          service.new(@project, @user).execute(@oldrev, @newrev, 'refs/heads/feature')
          reload_mrs
          empty_fork_merge_request.reload
        end

        it 'only updates the non-empty MRs' 

      end
    end

    context 'manual merge of source branch' do
      before do
        # Merge master -> feature branch
        @project.repository.merge(@user, @merge_request.diff_head_sha, @merge_request, 'Test message')
        commit = @project.repository.commit('feature')
        service.new(@project, @user).execute(@oldrev, commit.id, 'refs/heads/feature')
        reload_mrs
      end

      it 'updates the merge state' 

    end

    context 'push to fork repo source branch' do
      let(:refresh_service) { service.new(@fork_project, @user) }

      context 'open fork merge request' do
        before do
          allow(refresh_service).to receive(:execute_hooks)
          refresh_service.execute(@oldrev, @newrev, 'refs/heads/master')
          reload_mrs
        end

        it 'executes hooks with update action' 

      end

      context 'closed fork merge request' do
        before do
          @fork_merge_request.close!
          allow(refresh_service).to receive(:execute_hooks)
          refresh_service.execute(@oldrev, @newrev, 'refs/heads/master')
          reload_mrs
        end

        it 'do not execute hooks with update action' 


        it 'updates merge request to closed state' 

      end
    end

    context 'push to fork repo target branch' do
      describe 'changes to merge requests' do
        before do
          service.new(@fork_project, @user).execute(@oldrev, @newrev, 'refs/heads/feature')
          reload_mrs
        end

        it 'updates the merge request state' 

      end

      describe 'merge request diff' do
        it 'does not reload the diff of the merge request made from fork' 

      end
    end

    context 'forked projects with the same source branch name as target branch' do
      let!(:first_commit) do
        @fork_project.repository.create_file(@user, 'test1.txt', 'Test data',
                                             message: 'Test commit',
                                             branch_name: 'master')
      end
      let!(:second_commit) do
        @fork_project.repository.create_file(@user, 'test2.txt', 'More test data',
                                             message: 'Second test commit',
                                             branch_name: 'master')
      end
      let!(:forked_master_mr) do
        create(:merge_request,
               source_project: @fork_project,
               source_branch: 'master',
               target_branch: 'master',
               target_project: @project)
      end
      let(:force_push_commit) { @project.commit('feature').id }

      it 'should reload a new diff for a push to the forked project' 


      it 'should reload a new diff for a force push to the source branch' 


      it 'should reload a new diff for a force push to the target branch' 


      it 'should reload a new diff for a push to the target project that contains a commit in the MR' 


      it 'should not increase the diff count for a new push to target branch' 

    end

    context 'push to origin repo target branch after fork project was removed' do
      before do
        @fork_project.destroy
        service.new(@project, @user).execute(@oldrev, @newrev, 'refs/heads/feature')
        reload_mrs
      end

      it 'updates the merge request state' 

    end

    context 'push new branch that exists in a merge request' do
      let(:refresh_service) { service.new(@fork_project, @user) }

      it 'refreshes the merge request' 

    end

    context 'merge request metrics' do
      let(:issue) { create :issue, project: @project }
      let(:commit_author) { create :user }
      let(:commit) { project.commit }

      before do
        project.add_developer(commit_author)
        project.add_developer(user)

        allow(commit).to receive_messages(
          safe_message: "Closes #{issue.to_reference}",
          references: [issue],
          author_name: commit_author.name,
          author_email: commit_author.email,
          committed_date: Time.now
        )

        allow_any_instance_of(MergeRequest).to receive(:commits).and_return([commit])
      end

      context 'when the merge request is sourced from the same project' do
        it 'creates a `MergeRequestsClosingIssues` record for each issue closed by a commit' 

      end

      context 'when the merge request is sourced from a different project' do
        it 'creates a `MergeRequestsClosingIssues` record for each issue closed by a commit' 

      end
    end

    context 'marking the merge request as work in progress' do
      let(:refresh_service) { service.new(@project, @user) }
      before do
        allow(refresh_service).to receive(:execute_hooks)
      end

      it 'marks the merge request as work in progress from fixup commits' 


      it 'references the commit that caused the Work in Progress status' 


      it 'does not mark as WIP based on commits that do not belong to an MR' 

    end

    def reload_mrs
      @merge_request.reload
      @fork_merge_request.reload
      @build_failed_todo.reload
      @fork_build_failed_todo.reload
    end
  end
end

