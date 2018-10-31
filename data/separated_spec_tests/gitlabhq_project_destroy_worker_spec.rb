require 'spec_helper'

describe ProjectDestroyWorker do
  let(:project) { create(:project, :repository, pending_delete: true) }
  let(:path) { project.repository.path_to_repo }

  subject { described_class.new }

  describe '#perform' do
    it 'deletes the project' 


    it 'deletes the project but skips repo deletion' 


    it 'does not raise error when project could not be found' 


    it 'does not raise error when user could not be found' 

  end
end

