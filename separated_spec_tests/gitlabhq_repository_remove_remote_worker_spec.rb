require 'rails_helper'

describe RepositoryRemoveRemoteWorker do
  subject(:worker) { described_class.new }

  describe '#perform' do
    let(:remote_name) { 'joe'}
    let!(:project) { create(:project, :repository) }

    context 'when it cannot obtain lease' do
      it 'logs error' 

    end

    context 'when it gets the lease' do
      before do
        allow_any_instance_of(Gitlab::ExclusiveLease).to receive(:try_obtain).and_return(true)
      end

      context 'when project does not exist' do
        it 'returns nil' 

      end

      context 'when project exists' do
        it 'removes remote from repository' 

      end
    end
  end

  def create_remote_branch(remote_name, branch_name, target)
    rugged = project.repository.rugged
    rugged.references.create("refs/remotes/#{remote_name}/#{branch_name}", target.id)
  end
end

