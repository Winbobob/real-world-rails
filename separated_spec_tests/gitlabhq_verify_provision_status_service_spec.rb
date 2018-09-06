require 'spec_helper'

describe Clusters::Gcp::VerifyProvisionStatusService do
  include GoogleApi::CloudPlatformHelpers

  describe '#execute' do
    let(:provider) { create(:cluster_provider_gcp, :creating) }
    let(:gcp_project_id) { provider.gcp_project_id }
    let(:zone) { provider.zone }
    let(:operation_id) { provider.operation_id }

    shared_examples 'continue_creation' do
      it 'schedules a worker for status minitoring' 

    end

    shared_examples 'finalize_creation' do
      it 'schedules a worker for status minitoring' 

    end

    shared_examples 'error' do
      it 'sets an error to provider object' 

    end

    context 'when operation status is RUNNING' do
      before do
        stub_cloud_platform_get_zone_operation(
          gcp_project_id, zone, operation_id,
          {
            "status": 'RUNNING',
            "startTime": 1.minute.ago.strftime("%FT%TZ")
          } )
      end

      it_behaves_like 'continue_creation'

      context 'when cluster creation time exceeds timeout' do
        before do
          stub_cloud_platform_get_zone_operation(
            gcp_project_id, zone, operation_id,
            {
              "status": 'RUNNING',
              "startTime": 30.minutes.ago.strftime("%FT%TZ")
            } )
        end

        it_behaves_like 'error'
      end
    end

    context 'when operation status is PENDING' do
      before do
        stub_cloud_platform_get_zone_operation(
          gcp_project_id, zone, operation_id,
          {
            "status": 'PENDING',
            "startTime": 1.minute.ago.strftime("%FT%TZ")
          } )
      end

      it_behaves_like 'continue_creation'
    end

    context 'when operation status is DONE' do
      before do
        stub_cloud_platform_get_zone_operation(
          gcp_project_id, zone, operation_id,
          {
            "status": 'DONE'
          } )
      end

      it_behaves_like 'finalize_creation'
    end

    context 'when operation status is unexpected' do
      before do
        stub_cloud_platform_get_zone_operation(
          gcp_project_id, zone, operation_id,
          {
            "status": 'unexpected'
          } )
      end

      it_behaves_like 'error'
    end

    context 'when failed to get operation status' do
      before do
        stub_cloud_platform_get_zone_operation_error(gcp_project_id, zone, operation_id)
      end

      it_behaves_like 'error'
    end
  end
end

