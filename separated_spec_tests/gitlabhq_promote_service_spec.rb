require 'spec_helper'

describe Milestones::PromoteService do
  let(:group) { create(:group) }
  let(:project) { create(:project, namespace: group) }
  let(:user) { create(:user) }
  let(:milestone_title) { 'project milestone' }
  let(:milestone) { create(:milestone, project: project, title: milestone_title) }
  let(:service) { described_class.new(project, user) }

  describe '#execute' do
    before do
      group.add_master(user)
    end

    context 'validations' do
      it 'raises error if milestone does not belong to a project' 


      it 'raises error if project does not belong to a group' 


      it 'does not promote milestone and update issuables if promoted milestone is not valid' 

    end

    context 'without duplicated milestone titles across projects' do
      it 'promotes project milestone to group milestone' 


      it 'does not update issuables without milestone with the new promoted milestone' 


      it 'sets issuables with new promoted milestone' 

    end

    context 'with duplicated milestone titles across projects' do
      let(:project_2) { create(:project, namespace: group) }
      let!(:milestone_2) { create(:milestone, project: project_2, title: milestone_title) }

      it 'deletes project milestones with the same title' 


      it 'does not update issuables without milestone with the new promoted milestone' 


      it 'sets all issuables with new promoted milestone' 

    end
  end
end

