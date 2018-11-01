require 'spec_helper'

describe Clusters::UpdateService do
  describe '#execute' do
    subject { described_class.new(cluster.user, params).execute(cluster) }

    let(:cluster) { create(:cluster, :project, :provided_by_user) }

    context 'when correct params' do
      context 'when enabled is true' do
        let(:params) { { enabled: true } }

        it 'enables cluster' 

      end

      context 'when enabled is false' do
        let(:params) { { enabled: false } }

        it 'disables cluster' 

      end

      context 'when namespace is specified' do
        let(:params) do
          {
            platform_kubernetes_attributes: {
              namespace: 'custom-namespace'
            }
          }
        end

        it 'updates namespace' 

      end
    end

    context 'when invalid params' do
      let(:params) do
        {
          platform_kubernetes_attributes: {
            namespace: '!!!'
          }
        }
      end

      it 'returns false' 

    end
  end
end

