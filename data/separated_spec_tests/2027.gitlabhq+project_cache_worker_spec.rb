require 'spec_helper'

describe ProjectCacheWorker do
  include ExclusiveLeaseHelpers

  let(:worker) { described_class.new }
  let(:project) { create(:project, :repository) }
  let(:statistics) { project.statistics }
  let(:lease_key) { "project_cache_worker:#{project.id}:update_statistics" }
  let(:lease_timeout) { ProjectCacheWorker::LEASE_TIMEOUT }

  describe '#perform' do
    before do
      stub_exclusive_lease(lease_key, timeout: lease_timeout)
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

