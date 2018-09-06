require 'spec_helper'

describe ClusterSerializer do
  describe '#represent_status' do
    subject { described_class.new.represent_status(cluster) }

    context 'when provider type is gcp' do
      let(:cluster) { create(:cluster, provider_type: :gcp, provider_gcp: provider) }
      let(:provider) { create(:cluster_provider_gcp, :errored) }

      it 'serializes only status' 

    end

    context 'when provider type is user' do
      let(:cluster) { create(:cluster, provider_type: :user) }

      it 'serializes only status' 

    end
  end
end

