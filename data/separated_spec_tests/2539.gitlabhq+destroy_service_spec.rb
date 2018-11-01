require 'spec_helper'

describe Milestones::DestroyService do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:milestone) { create(:milestone, title: 'Milestone v1.0', project: project) }

  before do
    project.add_maintainer(user)
  end

  def service
    described_class.new(project, user, {})
  end

  describe '#execute' do
    it 'deletes milestone' 


    it 'deletes milestone id from issuables' 


    it 'logs destroy event' 


    context 'group milestones' do
      let(:group) { create(:group) }
      let(:group_milestone) { create(:milestone, group: group) }

      before do
        project.update(namespace: group)
        group.add_developer(user)
      end

      it { expect(service.execute(group_milestone)).to eq(group_milestone) }

      it 'deletes milestone id from issuables' 


      it 'does not log destroy event' 

    end
  end
end

