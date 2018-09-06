require 'spec_helper'

describe ProjectCacheWorker do
  let(:worker) { described_class.new }
  let(:project) { create(:project, :repository) }
  let(:statistics) { project.statistics }

  describe '#perform' do
    before do
      allow_any_instance_of(Gitlab::ExclusiveLease).to receive(:try_obtain)
        .and_return(true)
    end

    context 'with a non-existing project' do
      it 'does nothing' 

    end

    context 'with an existing project without a repository' do
      it 'does nothing' 

    end

    context 'with an existing project' do
      it 'updates the project statistics' 


      it 'refreshes the method caches' 


      context 'with plain readme' do
        it 'refreshes the method caches' 

      end
    end
  end

  describe '#update_statistics' do
    context 'when a lease could not be obtained' do
      it 'does not update the repository size' 

    end

    context 'when a lease could be obtained' do
      it 'updates the project statistics' 

    end
  end
end

