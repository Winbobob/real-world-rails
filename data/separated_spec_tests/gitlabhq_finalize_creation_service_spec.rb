require 'spec_helper'

describe Clusters::Gcp::FinalizeCreationService do
  include GoogleApi::CloudPlatformHelpers
  include KubernetesHelpers

  describe '#execute' do
    let(:cluster) { create(:cluster, :project, :providing_by_gcp) }
    let(:provider) { cluster.provider }
    let(:platform) { cluster.platform }
    let(:gcp_project_id) { provider.gcp_project_id }
    let(:zone) { provider.zone }
    let(:cluster_name) { cluster.name }

    shared_examples 'success' do
      it 'configures provider and kubernetes' 

    end

    shared_examples 'error' do
      it 'sets an error to provider object' 

    end

    context 'when suceeded to fetch gke cluster info' do
      let(:endpoint) { '111.111.111.111' }
      let(:api_url) { 'https://' + endpoint }
      let(:username) { 'sample-username' }
      let(:password) { 'sample-password' }

      before do
        stub_cloud_platform_get_zone_cluster(
          gcp_project_id, zone, cluster_name,
          {
            endpoint: endpoint,
            username: username,
            password: password
          }
        )

        stub_kubeclient_discover(api_url)
      end

      context 'when suceeded to fetch kuberenetes token' do
        let(:token) { 'sample-token' }

        before do
          stub_kubeclient_get_secrets(
            api_url,
            {
              token: Base64.encode64(token)
            } )
        end

        it_behaves_like 'success'

        it 'has corresponded data' 

      end

      context 'when default-token is not found' do
        before do
          stub_kubeclient_get_secrets(api_url, metadata_name: 'aaaa')
        end

        it_behaves_like 'error'
      end

      context 'when token is empty' do
        before do
          stub_kubeclient_get_secrets(api_url, token: '')
        end

        it_behaves_like 'error'
      end

      context 'when failed to fetch kuberenetes token' do
        before do
          stub_kubeclient_get_secrets_error(api_url)
        end

        it_behaves_like 'error'
      end
    end

    context 'when failed to fetch gke cluster info' do
      before do
        stub_cloud_platform_get_zone_cluster_error(gcp_project_id, zone, cluster_name)
      end

      it_behaves_like 'error'
    end
  end
end

