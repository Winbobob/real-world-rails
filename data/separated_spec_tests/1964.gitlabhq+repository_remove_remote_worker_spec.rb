require 'rails_helper'

describe RepositoryRemoveRemoteWorker do
  include ExclusiveLeaseHelpers
  include GitHelpers

  describe '#perform' do
    let!(:project) { create(:project, :repository) }
    let(:remote_name) { 'joe'}
    let(:lease_key) { "remove_remote_#{project.id}_#{remote_name}" }
    let(:lease_timeout) { RepositoryRemoveRemoteWorker::LEASE_TIMEOUT }

    it 'returns nil when project does not exist' 


    context 'when project exists' do
      before do
        allow(Project)
          .to receive(:find_by)
          .with(id: project.id)
          .and_return(project)
      end

      it 'does not remove remote when cannot obtain lease' 


      it 'removes remote from repository when obtain a lease' 

    end
  end

  def create_remote_branch(remote_name, branch_name, target)
    rugged = rugged_repo(project.repository)

    rugged.references.create("refs/remotes/#{remote_name}/#{branch_name}", target.id)
  end
end

