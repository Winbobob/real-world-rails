require 'spec_helper'

describe Gitlab::ImportExport::GroupProjectObjectBuilder do
  let(:project) do
    create(:project,
           :builds_disabled,
           :issues_disabled,
           name: 'project',
           path: 'project',
           group: create(:group))
  end

  context 'labels' do
    it 'finds the right group label' 


    it 'creates a new label' 

  end

  context 'milestones' do
    it 'finds the right group milestone' 


    it 'creates a new milestone' 

  end
end

