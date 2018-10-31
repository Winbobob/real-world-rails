require 'spec_helper'

describe MilestonesRoutingHelper do
  let(:project) { build_stubbed(:project) }
  let(:group) { build_stubbed(:group) }

  describe '#milestone_path' do
    context 'for a group milestone' do
      let(:milestone) { build_stubbed(:milestone, group: group, iid: 1) }

      it 'links to the group milestone page' 

    end

    context 'for a project milestone' do
      let(:milestone) { build_stubbed(:milestone, project: project, iid: 1) }

      it 'links to the project milestone page' 

    end
  end

  describe '#milestone_url' do
    context 'for a group milestone' do
      let(:milestone) { build_stubbed(:milestone, group: group, iid: 1) }

      it 'links to the group milestone page' 

    end

    context 'for a project milestone' do
      let(:milestone) { build_stubbed(:milestone, project: project, iid: 1) }

      it 'links to the project milestone page' 

    end
  end
end

