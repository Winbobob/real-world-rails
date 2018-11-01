require 'spec_helper'

describe Clusters::Gcp::FetchOperationService do
  include GoogleApi::CloudPlatformHelpers

  describe '#execute' do
    let(:provider) { create(:cluster_provider_gcp, :creating) }
    let(:gcp_project_id) { provider.gcp_project_id }
    let(:zone) { provider.zone }
    let(:operation_id) { provider.operation_id }

    shared_examples 'success' do
      it 'yields' 

    end

    shared_examples 'error' do
      it 'sets an error to provider object' 

    end

    context 'when suceeded to fetch operation' do
      before do
        stub_cloud_platform_get_zone_operation(gcp_project_id, zone, operation_id)
      end

      it_behaves_like 'success'
    end

    context 'when Internal Server Error happened' do
      before do
        stub_cloud_platform_get_zone_operation_error(gcp_project_id, zone, operation_id)
      end

      it_behaves_like 'error'
    end
  end
end

