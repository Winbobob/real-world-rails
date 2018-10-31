require 'spec_helper'

describe ProjectMigrateHashedStorageWorker, :clean_gitlab_redis_shared_state do
  describe '#perform' do
    let(:project) { create(:project, :empty_repo) }
    let(:pending_delete_project) { create(:project, :empty_repo, pending_delete: true) }

    context 'when have exclusive lease' do
      before do
        lease = subject.lease_for(project.id)

        allow(Gitlab::ExclusiveLease).to receive(:new).and_return(lease)
        allow(lease).to receive(:try_obtain).and_return(true)
      end

      it 'skips when project no longer exists' 


      it 'skips when project is pending delete' 


      it 'delegates removal to service class' 

    end

    context 'when dont have exclusive lease' do
      before do
        lease = subject.lease_for(project.id)

        allow(Gitlab::ExclusiveLease).to receive(:new).and_return(lease)
        allow(lease).to receive(:try_obtain).and_return(false)
      end

      it 'skips when dont have lease' 

    end
  end
end

