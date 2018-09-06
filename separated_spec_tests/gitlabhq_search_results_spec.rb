require 'spec_helper'

describe Gitlab::SearchResults do
  include ProjectForksHelper

  let(:user) { create(:user) }
  let!(:project) { create(:project, name: 'foo') }
  let!(:issue) { create(:issue, project: project, title: 'foo') }

  let!(:merge_request) do
    create(:merge_request, source_project: project, title: 'foo')
  end

  let!(:milestone) { create(:milestone, project: project, title: 'foo') }
  let(:results) { described_class.new(user, Project.all, 'foo') }

  context 'as a user with access' do
    before do
      project.add_developer(user)
    end

    describe '#objects' do
      it 'returns without_counts collection by default' 


      it 'returns with counts collection when requested' 

    end

    context "when count_limit is lower than total amount" do
      before do
        allow(results).to receive(:count_limit).and_return(1)
      end

      describe '#limited_projects_count' do
        it 'returns the limited amount of projects' 

      end

      describe '#limited_merge_requests_count' do
        it 'returns the limited amount of merge requests' 

      end

      describe '#limited_milestones_count' do
        it 'returns the limited amount of milestones' 

      end

      describe '#limited_issues_count' do
        it 'runs single SQL query to get the limited amount of issues' 

      end
    end

    context "when count_limit is higher than total amount" do
      describe '#limited_issues_count' do
        it 'runs multiple queries to get the limited amount of issues' 

      end
    end

    it 'includes merge requests from source and target projects' 


    describe '#merge_requests' do
      it 'includes project filter by default' 


      it 'it skips project filter if default project context is used' 

    end

    describe '#issues' do
      it 'includes project filter by default' 


      it 'it skips project filter if default project context is used' 

    end
  end

  it 'does not list issues on private projects' 


  describe 'confidential issues' do
    let(:project_1) { create(:project, :internal) }
    let(:project_2) { create(:project, :internal) }
    let(:project_3) { create(:project, :internal) }
    let(:project_4) { create(:project, :internal) }
    let(:query) { 'issue' }
    let(:limit_projects) { Project.where(id: [project_1.id, project_2.id, project_3.id]) }
    let(:author) { create(:user) }
    let(:assignee) { create(:user) }
    let(:non_member) { create(:user) }
    let(:member) { create(:user) }
    let(:admin) { create(:admin) }
    let!(:issue) { create(:issue, project: project_1, title: 'Issue 1') }
    let!(:security_issue_1) { create(:issue, :confidential, project: project_1, title: 'Security issue 1', author: author) }
    let!(:security_issue_2) { create(:issue, :confidential, title: 'Security issue 2', project: project_1, assignees: [assignee]) }
    let!(:security_issue_3) { create(:issue, :confidential, project: project_2, title: 'Security issue 3', author: author) }
    let!(:security_issue_4) { create(:issue, :confidential, project: project_3, title: 'Security issue 4', assignees: [assignee]) }
    let!(:security_issue_5) { create(:issue, :confidential, project: project_4, title: 'Security issue 5') }

    it 'does not list confidential issues for non project members' 


    it 'does not list confidential issues for project members with guest role' 


    it 'lists confidential issues for author' 


    it 'lists confidential issues for assignee' 


    it 'lists confidential issues for project members' 


    it 'lists all issues for admin' 

  end

  it 'does not list merge requests on projects with limited access' 

end

