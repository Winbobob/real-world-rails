require 'spec_helper'

describe ProjectDestroyWorker do
  let(:project) { create(:project, :repository, pending_delete: true) }
  let(:path) do
    Gitlab::GitalyClient::StorageSettings.allow_disk_access do
      project.repository.path_to_repo
    end
  end

  subject { described_class.new }

  describe '#perform' do
    it 'deletes the project' 


    it 'does not raise error when project could not be found' 


    it 'does not raise error when user could not be found' 

  end
end

