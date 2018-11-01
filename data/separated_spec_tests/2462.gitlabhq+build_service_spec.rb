require 'spec_helper'

describe MergeRequests::BuildService do
  using RSpec::Parameterized::TableSyntax
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:source_project) { nil }
  let(:target_project) { nil }
  let(:user) { create(:user) }
  let(:issue_confidential) { false }
  let(:issue) { create(:issue, project: project, title: 'A bug', confidential: issue_confidential) }
  let(:description) { nil }
  let(:source_branch) { 'feature-branch' }
  let(:target_branch) { 'master' }
  let(:milestone_id) { nil }
  let(:label_ids) { [] }
  let(:merge_request) { service.execute }
  let(:compare) { double(:compare, commits: commits) }
  let(:commit_1) { double(:commit_1, sha: 'f00ba7', safe_message: "Initial commit\n\nCreate the app") }
  let(:commit_2) { double(:commit_2, sha: 'f00ba7', safe_message: 'This is a bad commit message!') }
  let(:commits) { nil }

  let(:service) do
    described_class.new(project, user,
                                    description: description,
                                    source_branch: source_branch,
                                    target_branch: target_branch,
                                    source_project: source_project,
                                    target_project: target_project,
                                    milestone_id: milestone_id,
                                    label_ids: label_ids)
  end

  before do
    project.add_guest(user)
  end

  def stub_compare
    allow(CompareService).to receive_message_chain(:new, :execute).and_return(compare)
    allow(project).to receive(:commit).and_return(commit_1)
    allow(project).to receive(:commit).and_return(commit_2)
  end

  describe '#execute' do
    it 'calls the compare service with the correct arguments' 


    context 'missing source branch' do
      let(:source_branch) { '' }

      it 'forbids the merge request from being created' 


      it 'adds an error message to the merge request' 

    end

    context 'when target branch is missing' do
      let(:target_branch) { nil }
      let(:commits) { Commit.decorate([commit_1], project) }

      before do
        stub_compare
      end

      it 'creates compare object with target branch as default branch' 


      it 'allows the merge request to be created' 

    end

    context 'same source and target branch' do
      let(:source_branch) { 'master' }

      it 'forbids the merge request from being created' 


      it 'adds an error message to the merge request' 

    end

    context 'no commits in the diff' do
      let(:commits) { [] }

      before do
        stub_compare
      end

      it 'allows the merge request to be created' 


      it 'adds a WIP prefix to the merge request title' 

    end

    context 'one commit in the diff' do
      let(:commits) { Commit.decorate([commit_1], project) }
      let(:commit_description) { commit_1.safe_message.split(/\n+/, 2).last }

      before do
        stub_compare
      end

      it 'allows the merge request to be created' 


      it 'uses the title of the commit as the title of the merge request' 


      it 'uses the description of the commit as the description of the merge request' 


      context 'merge request already has a description set' do
        let(:description) { 'Merge request description' }

        it 'keeps the description from the initial params' 

      end

      context 'commit has no description' do
        let(:commits) { Commit.decorate([commit_2], project) }

        it 'uses the title of the commit as the title of the merge request' 


        it 'sets the description to nil' 

      end

      context 'when the source branch matches an issue' do
        where(:issue_tracker, :source_branch, :closing_message) do
          :jira                 | 'FOO-123-fix-issue' | 'Closes FOO-123'
          :jira                 | 'fix-issue'         | nil
          :custom_issue_tracker | '123-fix-issue'     | 'Closes #123'
          :custom_issue_tracker | 'fix-issue'         | nil
          :internal             | '123-fix-issue'     | 'Closes #123'
          :internal             | 'fix-issue'         | nil
        end

        with_them do
          before do
            if issue_tracker == :internal
              issue.update!(iid: 123)
            else
              create(:"#{issue_tracker}_service", project: project)
            end
          end

          it 'uses the title of the commit as the title of the merge request' 


          it 'appends the closing description' 

        end

        context 'when the source branch matches an internal issue' do
          let(:label) { create(:label, project: project) }
          let(:milestone) { create(:milestone, project: project) }
          let(:source_branch) { '123-fix-issue' }

          before do
            issue.update!(iid: 123, labels: [label], milestone: milestone)
          end

          it 'assigns the issue label and milestone' 


          context 'when milestone_id and label_ids are shared in the params' do
            let(:label2) { create(:label, project: project) }
            let(:milestone2) { create(:milestone, project: project) }
            let(:label_ids) { [label2.id] }
            let(:milestone_id) { milestone2.id }

            it 'assigns milestone_id and label_ids instead of issue labels and milestone' 

          end
        end
      end
    end

    context 'more than one commit in the diff' do
      let(:commits) { Commit.decorate([commit_1, commit_2], project) }

      before do
        stub_compare
      end

      it 'allows the merge request to be created' 


      it 'uses the title of the branch as the merge request title' 


      it 'does not add a description' 


      context 'merge request already has a description set' do
        let(:description) { 'Merge request description' }

        it 'keeps the description from the initial params' 

      end

      context 'when the source branch matches an issue' do
        where(:issue_tracker, :source_branch, :title, :closing_message) do
          :jira                 | 'FOO-123-fix-issue' | 'Resolve FOO-123 "Fix issue"' | 'Closes FOO-123'
          :jira                 | 'fix-issue'         | 'Fix issue'                   | nil
          :custom_issue_tracker | '123-fix-issue'     | 'Resolve #123 "Fix issue"'    | 'Closes #123'
          :custom_issue_tracker | 'fix-issue'         | 'Fix issue'                   | nil
          :internal             | '123-fix-issue'     | 'Resolve "A bug"'             | 'Closes #123'
          :internal             | 'fix-issue'         | 'Fix issue'                   | nil
          :internal             | '124-fix-issue'     | '124 fix issue'               | nil
        end

        with_them do
          before do
            if issue_tracker == :internal
              issue.update!(iid: 123)
            else
              create(:"#{issue_tracker}_service", project: project)
            end
          end

          it 'sets the correct title' 


          it 'sets the closing description' 

        end
      end

      context 'when the issue is not accessible to user' do
        let(:source_branch) { "#{issue.iid}-fix-issue" }

        before do
          project.team.truncate
        end

        it 'uses branch title as the merge request title' 


        it 'does not set a description' 

      end

      context 'when the issue is confidential' do
        let(:source_branch) { "#{issue.iid}-fix-issue" }
        let(:issue_confidential) { true }

        it 'uses the title of the branch as the merge request title' 


        it 'does not set a description' 

      end
    end

    context 'source branch does not exist' do
      before do
        allow(project).to receive(:commit).with(source_branch).and_return(nil)
        allow(project).to receive(:commit).with(target_branch).and_return(commit_1)
      end

      it 'forbids the merge request from being created' 


      it 'adds an error message to the merge request' 

    end

    context 'target branch does not exist' do
      before do
        allow(project).to receive(:commit).with(source_branch).and_return(commit_1)
        allow(project).to receive(:commit).with(target_branch).and_return(nil)
      end

      it 'forbids the merge request from being created' 


      it 'adds an error message to the merge request' 

    end

    context 'both source and target branches do not exist' do
      before do
        allow(project).to receive(:commit).and_return(nil)
      end

      it 'forbids the merge request from being created' 


      it 'adds both error messages to the merge request' 

    end

    context 'upstream project has disabled merge requests' do
      let(:upstream_project) { create(:project, :merge_requests_disabled) }
      let(:project) { create(:project, forked_from_project: upstream_project) }
      let(:commits) { Commit.decorate([commit_1], project) }

      it 'sets target project correctly' 

    end

    context 'target_project is set and accessible by current_user' do
      let(:target_project) { create(:project, :public, :repository)}
      let(:commits) { Commit.decorate([commit_1], project) }

      it 'sets target project correctly' 

    end

    context 'target_project is set but not accessible by current_user' do
      let(:target_project) { create(:project, :private, :repository)}
      let(:commits) { Commit.decorate([commit_1], project) }

      it 'sets target project correctly' 

    end

    context 'source_project is set and accessible by current_user' do
      let(:source_project) { create(:project, :public, :repository)}
      let(:commits) { Commit.decorate([commit_1], project) }

      it 'sets target project correctly' 

    end

    context 'source_project is set but not accessible by current_user' do
      let(:source_project) { create(:project, :private, :repository)}
      let(:commits) { Commit.decorate([commit_1], project) }

      it 'sets target project correctly' 

    end
  end
end

