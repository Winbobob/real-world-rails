require 'spec_helper'

describe WaitForClusterCreationWorker do
  describe '#perform' do
    context 'when provider type is gcp' do
      let(:cluster) { create(:cluster, provider_type: :gcp, provider_gcp: provider) }
      let(:provider) { create(:cluster_provider_gcp, :creating) }

      it 'provision a cluster' 

    end

    context 'when provider type is user' do
      let(:cluster) { create(:cluster, provider_type: :user) }

      it 'does not provision a cluster' 

    end

    context 'when cluster does not exist' do
      it 'does not provision a cluster' 

    end
  end
end

