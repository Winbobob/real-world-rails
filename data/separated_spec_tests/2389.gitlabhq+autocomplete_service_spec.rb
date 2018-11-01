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


    context 'with nested groups', :nested_groups do
      let(:subgroup) { create(:group, :public, parent: group) }
      let!(:subgroup_milestone) { create(:milestone, group: subgroup) }

      before do
        project.update(namespace: subgroup)
      end

      it 'includes project milestones and all acestors milestones' 

    end
  end

  describe '#labels_as_hash' do
    def expect_labels_to_equal(labels, expected_labels)
      expect(labels.size).to eq(expected_labels.size)
      extract_title = lambda { |label| label['title'] }
      expect(labels.map(&extract_title)).to eq(expected_labels.map(&extract_title))
    end

    let(:user) { create(:user) }
    let(:group) { create(:group, :nested) }
    let!(:sub_group) { create(:group, parent: group) }
    let(:project) { create(:project, :public, group: group) }
    let(:issue) { create(:issue, project: project) }

    let!(:label1) { create(:label, project: project) }
    let!(:label2) { create(:label, project: project) }
    let!(:sub_group_label) { create(:group_label, group: sub_group) }
    let!(:parent_group_label) { create(:group_label, group: group.parent, group_id: group.id) }

    before do
      create(:group_member, group: group, user: user)
    end

    it 'returns labels from project and ancestor groups' 


    context 'some labels are already assigned' do
      before do
        issue.labels << label1
      end

      it 'marks already assigned as set' 

    end
  end
end

