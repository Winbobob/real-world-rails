require 'spec_helper'

describe Gitlab::ImportExport do
  describe 'export filename' do
    let(:group) { create(:group, :nested) }
    let(:project) { create(:project, :public, path: 'project-path', namespace: group) }

    it 'contains the project path' 


    it 'contains the namespace path' 


    it 'does not go over a certain length' 

  end
end

