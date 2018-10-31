require 'spec_helper'

describe MergeRequests::MergeService do
  set(:user) { create(:user) }
  set(:user2) { create(:user) }
  let(:merge_request) { create(:merge_request, :simple, author: user2, assignee: user2) }
  let(:project) { merge_request.project }

  before do
    project.add_maintainer(user)
    project.add_developer(user2)
  end

  describe '#execute' do
    context 'valid params' do
      let(:service) { described_class.new(project, user, commit_message: 'Awesome message') }

      before do
        allow(service).to receive(:execute_hooks)

        perform_enqueued_jobs do
          service.execute(merge_request)
        end
      end

      it { expect(merge_request).to be_valid }
      it { expect(merge_request).to be_merged }

      it 'sends email to user2 about merge of new merge_request' 


      it 'creates system note about merge_request merge' 

    end

    context 'closes related issues' do
      let(:service) { described_class.new(project, user, commit_message: 'Awesome message') }

      before do
        allow(project).to receive(:default_branch).and_return(merge_request.target_branch)
      end

      it 'closes GitLab issue tracker issues' 


      context 'with JIRA integration' do
        include JiraServiceHelper

        let(:jira_tracker) { project.create_jira_service }
        let(:jira_issue)   { ExternalIssue.new('JIRA-123', project) }
        let(:commit)       { double('commit', safe_message: "Fixes #{jira_issue.to_reference}") }

        before do
          project.update!(has_external_issue_tracker: true)
          jira_service_settings
          stub_jira_urls(jira_issue.id)
          allow(merge_request).to receive(:commits).and_return([commit])
        end

        it 'closes issues on JIRA issue tracker' 


        context "when jira_issue_transition_id is not present" do
          before do
            allow_any_instance_of(JIRA::Resource::Issue).to receive(:resolution).and_return(nil)
          end

          it "does not close issue" 

        end

        context "wrong issue markdown" do
          it 'does not close issues on JIRA issue tracker' 

        end
      end
    end

    context 'closes related todos' do
      let(:merge_request) { create(:merge_request, assignee: user, author: user) }
      let(:project) { merge_request.project }
      let(:service) { described_class.new(project, user, commit_message: 'Awesome message') }
      let!(:todo) do
        create(:todo, :assigned,
          project: project,
          author: user,
          user: user,
          target: merge_request)
      end

      before do
        allow(service).to receive(:execute_hooks)

        perform_enqueued_jobs do
          service.execute(merge_request)
          todo.reload
        end
      end

      it { expect(todo).to be_done }
    end

    context 'source branch removal' do
      context 'when the source branch is protected' do
        let(:service) do
          described_class.new(project, user, 'should_remove_source_branch' => true)
        end

        before do
          create(:protected_branch, project: project, name: merge_request.source_branch)
        end

        it 'does not delete the source branch' 

      end

      context 'when the source branch is the default branch' do
        let(:service) do
          described_class.new(project, user, 'should_remove_source_branch' => true)
        end

        before do
          allow(project).to receive(:root_ref?).with(merge_request.source_branch).and_return(true)
        end

        it 'does not delete the source branch' 

      end

      context 'when the source branch can be removed' do
        context 'when MR author set the source branch to be removed' do
          let(:service) { described_class.new(project, user, commit_message: 'Awesome message') }

          before do
            merge_request.update_attribute(:merge_params, { 'force_remove_source_branch' => '1' })
          end

          it 'removes the source branch using the author user' 


          context 'when the merger set the source branch not to be removed' do
            let(:service) { described_class.new(project, user, commit_message: 'Awesome message', 'should_remove_source_branch' => false) }

            it 'does not delete the source branch' 

          end
        end

        context 'when MR merger set the source branch to be removed' do
          let(:service) do
            described_class.new(project, user, commit_message: 'Awesome message', 'should_remove_source_branch' => true)
          end

          it 'removes the source branch using the current user' 

        end
      end
    end

    context "error handling" do
      let(:service) { described_class.new(project, user, commit_message: 'Awesome message') }

      before do
        allow(Rails.logger).to receive(:error)
      end

      it 'logs and saves error if there is an exception' 


      it 'logs and saves error if there is an PreReceiveError exception' 


      it 'logs and saves error if there is a merge conflict' 


      context 'when squashing' do
        before do
          merge_request.update!(source_branch: 'master', target_branch: 'feature')
        end

        it 'logs and saves error if there is an error when squashing' 


        it 'logs and saves error if there is a squash in progress' 


        context "when fast-forward merge is not allowed" do
          before do
            allow_any_instance_of(Repository).to receive(:ancestor?).and_return(nil)
          end

          %w(semi-linear ff).each do |merge_method|
            it "logs and saves error if merge is #{merge_method} only" 

          end
        end
      end
    end
  end
end

