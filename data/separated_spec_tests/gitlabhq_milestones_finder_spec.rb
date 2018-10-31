require 'spec_helper'

describe MilestonesFinder do
  let(:group) { create(:group) }
  let(:project_1) { create(:project, namespace: group) }
  let(:project_2) { create(:project, namespace: group) }
  let!(:milestone_1) { create(:milestone, group: group, title: 'one test', due_date: Date.today) }
  let!(:milestone_2) { create(:milestone, group: group) }
  let!(:milestone_3) { create(:milestone, project: project_1, state: 'active', due_date: Date.tomorrow) }
  let!(:milestone_4) { create(:milestone, project: project_2, state: 'active') }

  it 'it returns milestones for projects' 


  it 'returns milestones for groups' 


  context 'milestones for groups and project' do
    let(:result) do
      described_class.new(project_ids: [project_1.id, project_2.id], group_ids: group.id, state: 'all').execute
    end

    it 'returns milestones for groups and projects' 


    it 'orders milestones by due date' 

  end

  context 'with filters' do
    let(:params) do
      {
        project_ids: [project_1.id, project_2.id],
        group_ids: group.id,
        state: 'all'
      }
    end

    before do
      milestone_1.close
      milestone_3.close
    end

    it 'filters by active state' 


    it 'filters by closed state' 


    it 'filters by title' 

  end

  describe '#find_by' do
    it 'finds a single milestone' 

  end
end

