require 'spec_helper'

describe MergeRequestsFinder do
  include ProjectForksHelper

  let(:user)  { create :user }
  let(:user2) { create :user }

  let(:group) { create(:group) }
  let(:subgroup) { create(:group, parent: group) }
  let(:project1) { create(:project, :public, group: group) }
  let(:project2) { fork_project(project1, user) }
  let(:project3) do
    p = fork_project(project1, user)
    p.update!(archived: true)
    p
  end
  let(:project4) { create(:project, :public, group: subgroup) }

  let!(:merge_request1) { create(:merge_request, :simple, author: user, source_project: project2, target_project: project1) }
  let!(:merge_request2) { create(:merge_request, :conflict, author: user, source_project: project2, target_project: project1, state: 'closed') }
  let!(:merge_request3) { create(:merge_request, :simple, author: user, source_project: project2, target_project: project2) }
  let!(:merge_request4) { create(:merge_request, :simple, author: user, source_project: project3, target_project: project3) }
  let!(:merge_request5) { create(:merge_request, :simple, author: user, source_project: project4, target_project: project4) }

  before do
    project1.add_master(user)
    project2.add_developer(user)
    project3.add_developer(user)
    project2.add_developer(user2)
    project4.add_developer(user)
  end

  describe "#execute" do
    it 'filters by scope' 


    it 'filters by project' 


    it 'filters by group' 


    it 'filters by group including subgroups', :nested_groups do
      params = { group_id: group.id, include_subgroups: true }

      merge_requests = described_class.new(user, params).execute

      expect(merge_requests.size).to eq(3)
    end

    it 'filters by non_archived' 


    it 'filters by iid' 


    it 'filters by source branch' 


    it 'filters by target branch' 


    context 'filtering by group milestone' do
      let!(:group) { create(:group, :public) }
      let(:group_milestone) { create(:milestone, group: group) }
      let!(:group_member) { create(:group_member, group: group, user: user) }
      let(:params) { { milestone_title: group_milestone.title } }

      before do
        project2.update(namespace: group)
        merge_request2.update(milestone: group_milestone)
        merge_request3.update(milestone: group_milestone)
      end

      it 'returns issues assigned to that group milestone' 

    end

    context 'filtering by created_at/updated_at' do
      let(:new_project) { create(:project, forked_from_project: project1) }

      let!(:new_merge_request) do
        create(:merge_request,
               :simple,
               author: user,
               created_at: 1.week.from_now,
               updated_at: 1.week.from_now,
               source_project: new_project,
               target_project: new_project)
      end

      let!(:old_merge_request) do
        create(:merge_request,
               :simple,
               author: user,
               source_branch: 'feature_1',
               created_at: 1.week.ago,
               updated_at: 1.week.ago,
               source_project: new_project,
               target_project: new_project)
      end

      before do
        new_project.add_master(user)
      end

      it 'filters by created_after' 


      it 'filters by created_before' 


      it 'filters by created_after and created_before' 


      it 'filters by updated_after' 


      it 'filters by updated_before' 


      it 'filters by updated_after and updated_before' 

    end
  end

  describe '#row_count', :request_store do
    it 'returns the number of rows for the default state' 


    it 'returns the number of rows for a given state' 

  end
end

