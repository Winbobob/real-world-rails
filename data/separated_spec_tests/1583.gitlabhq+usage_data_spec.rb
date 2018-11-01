require 'spec_helper'

describe Gitlab::UsageData do
  let(:projects) { create_list(:project, 3) }
  let!(:board) { create(:board, project: projects[0]) }

  describe '#data' do
    before do
      create(:jira_service, project: projects[0])
      create(:jira_service, project: projects[1])
      create(:prometheus_service, project: projects[1])
      create(:service, project: projects[0], type: 'SlackSlashCommandsService', active: true)
      create(:service, project: projects[1], type: 'SlackService', active: true)
      create(:service, project: projects[2], type: 'SlackService', active: true)

      gcp_cluster = create(:cluster, :provided_by_gcp)
      create(:cluster, :provided_by_user)
      create(:cluster, :provided_by_user, :disabled)
      create(:clusters_applications_helm, :installed, cluster: gcp_cluster)
      create(:clusters_applications_ingress, :installed, cluster: gcp_cluster)
      create(:clusters_applications_prometheus, :installed, cluster: gcp_cluster)
      create(:clusters_applications_runner, :installed, cluster: gcp_cluster)
    end

    subject { described_class.data }

    it "gathers usage data" 


    it "gathers usage counts" 


    it 'gathers projects data correctly' 


    it 'works when queries time out' 

  end

  describe '#features_usage_data_ce' do
    subject { described_class.features_usage_data_ce }

    it 'gathers feature usage data' 

  end

  describe '#components_usage_data' do
    subject { described_class.components_usage_data }

    it 'gathers components usage data' 

  end

  describe '#license_usage_data' do
    subject { described_class.license_usage_data }

    it "gathers license data" 

  end

  describe '#count' do
    let(:relation) { double(:relation) }

    it 'returns the count when counting succeeds' 


    it 'returns the fallback value when counting fails' 

  end
end

