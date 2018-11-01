require 'spec_helper'

describe Gitlab::Ci::Build::Policy::Kubernetes do
  let(:pipeline) { create(:ci_pipeline, project: project) }

  context 'when kubernetes service is active' do
    shared_examples 'same behavior between KubernetesService and Platform::Kubernetes' do
      it 'is satisfied by a kubernetes pipeline' 

    end

    context 'when user configured kubernetes from Integration > Kubernetes' do
      let(:project) { create(:kubernetes_project) }

      it_behaves_like 'same behavior between KubernetesService and Platform::Kubernetes'
    end

    context 'when user configured kubernetes from CI/CD > Clusters' do
      let!(:cluster) { create(:cluster, :project, :provided_by_gcp) }
      let(:project) { cluster.project }

      it_behaves_like 'same behavior between KubernetesService and Platform::Kubernetes'
    end
  end

  context 'when kubernetes service is inactive' do
    set(:project) { create(:project) }

    it 'is not satisfied by a pipeline without kubernetes available' 

  end

  context 'when kubernetes policy is invalid' do
    it 'raises an error' 

  end
end

