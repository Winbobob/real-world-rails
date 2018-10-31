require 'spec_helper'

describe MergeRequests::CreateFromIssueService do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }
  let(:label_ids) { create_pair(:label, project: project).map(&:id) }
  let(:milestone_id) { create(:milestone, project: project).id }
  let(:issue) { create(:issue, project: project, milestone_id: milestone_id) }
  let(:custom_source_branch) { 'custom-source-branch' }

  subject(:service) { described_class.new(project, user, issue_iid: issue.iid) }
  subject(:service_with_custom_source_branch) { described_class.new(project, user, issue_iid: issue.iid, branch_name: custom_source_branch) }

  before do
    project.add_developer(user)
  end

  describe '#execute' do
    it 'returns an error with invalid issue iid' 


    it 'delegates issue search to IssuesFinder' 


    it "inherits labels" 


    it "inherits milestones" 


    it 'delegates the branch creation to CreateBranchService' 


    it 'creates a branch based on issue title' 


    it 'creates a branch using passed name' 


    it 'creates a system note' 


    it 'creates a merge request' 


    it 'sets the merge request title to: "WIP: Resolves "$issue-title"' 


    it 'sets the merge request author to current user' 


    it 'sets the merge request source branch to the new issue branch' 


    it 'sets the merge request source branch to the passed branch name' 


    it 'sets the merge request target branch to the project default branch' 


    it 'executes quick actions if the build service sets them in the description' 


    context 'when ref branch is set' do
      subject { described_class.new(project, user, issue_iid: issue.iid, ref: 'feature').execute }

      it 'sets the merge request source branch to the new issue branch' 


      it 'sets the merge request target branch to the ref branch' 


      context 'when ref branch does not exist' do
        subject { described_class.new(project, user, issue_iid: issue.iid, ref: 'no-such-branch').execute }

        it 'creates a merge request' 


        it 'sets the merge request target branch to the project default branch' 

      end
    end
  end
end

