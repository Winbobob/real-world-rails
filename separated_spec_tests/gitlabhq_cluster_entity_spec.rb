require 'spec_helper'

describe ClusterEntity do
  describe '#as_json' do
    subject { described_class.new(cluster).as_json }

    context 'when provider type is gcp' do
      let(:cluster) { create(:cluster, provider_type: :gcp, provider_gcp: provider) }

      context 'when status is creating' do
        let(:provider) { create(:cluster_provider_gcp, :creating) }

        it 'has corresponded data' 

      end

      context 'when status is errored' do
        let(:provider) { create(:cluster_provider_gcp, :errored) }

        it 'has corresponded data' 

      end
    end

    context 'when provider type is user' do
      let(:cluster) { create(:cluster, provider_type: :user) }

      it 'has corresponded data' 

    end

    context 'when no application has been installed' do
      let(:cluster) { create(:cluster) }
      subject { described_class.new(cluster).as_json[:applications]}

      it 'contains helm as not_installable' 

    end
  end
end

