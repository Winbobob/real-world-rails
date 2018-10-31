require 'spec_helper'

describe Projects::AutocompleteService do
  describe '#issues' do
    describe 'confidential issues' do
      let(:author) { create(:user) }
      let(:assignee) { create(:user) }
      let(:non_member) { create(:user) }
      let(:member) { create(:user) }
      let(:admin) { create(:admin) }
      let(:project) { create(:project, :public) }
      let!(:issue) { create(:issue, project: project, title: 'Issue 1') }
      let!(:security_issue_1) { create(:issue, :confidential, project: project, title: 'Security issue 1', author: author) }
      let!(:security_issue_2) { create(:issue, :confidential, title: 'Security issue 2', project: project, assignees: [assignee]) }

      it 'does not list project confidential issues for guests' 


      it 'does not list project confidential issues for non project members' 


      it 'does not list project confidential issues for project members with guest role' 


      it 'lists project confidential issues for author' 


      it 'lists project confidential issues for assignee' 


      it 'lists project confidential issues for project members' 


      it 'lists all project issues for admin' 

    end
  end

  describe '#milestones' do
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:project) { create(:project, group: group) }
    let!(:group_milestone1) { create(:milestone, group: group, due_date: '2017-01-01', title: 'Second Title') }
    let!(:group_milestone2) { create(:milestone, group: group, due_date: '2017-01-01', title: 'First Title') }
    let!(:project_milestone) { create(:milestone, project: project, due_date: '2016-01-01') }

    let(:milestone_titles) { described_class.new(project, user).milestones.map(&:title) }

    it 'includes project and group milestones and sorts them correctly' 


    it 'does not include closed milestones' 


    it 'does not include milestones from other projects in the group' 

  end
end

