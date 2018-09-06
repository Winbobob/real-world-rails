require 'spec_helper'

describe ReactiveCachingWorker do
  let(:service) { project.deployment_platform }

  describe '#perform' do
    context 'when user configured kubernetes from Integration > Kubernetes' do
      let(:project) { create(:kubernetes_project) }

      it 'calls #exclusively_update_reactive_cache!' 

    end

    context 'when user configured kubernetes from CI/CD > Clusters' do
      let!(:cluster) { create(:cluster, :project, :provided_by_gcp) }
      let(:project) { cluster.project }

      it 'calls #exclusively_update_reactive_cache!' 

    end
  end
end

