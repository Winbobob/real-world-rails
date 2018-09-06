require 'spec_helper'

describe SubmitUsagePingService do
  context 'when usage ping is disabled' do
    before do
      stub_application_setting(usage_ping_enabled: false)
    end

    it 'does not run' 

  end

  context 'when usage ping is enabled' do
    before do
      stub_application_setting(usage_ping_enabled: true)
    end

    it 'sends a POST request' 


    it 'refreshes usage data statistics before submitting' 


    it 'saves conversational development index data from the response' 

  end

  def without_conv_index_params
    {
      conv_index: {}
    }
  end

  def with_conv_index_params
    {
      conv_index: {
        leader_issues: 10.2,
        instance_issues: 3.2,
        percentage_issues: 31.37,

        leader_notes: 25.3,
        instance_notes: 23.2,

        leader_milestones: 16.2,
        instance_milestones: 5.5,

        leader_boards: 5.2,
        instance_boards: 3.2,

        leader_merge_requests: 5.2,
        instance_merge_requests: 3.2,

        leader_ci_pipelines: 25.1,
        instance_ci_pipelines: 21.3,

        leader_environments: 3.3,
        instance_environments: 2.2,

        leader_deployments: 41.3,
        instance_deployments: 15.2,

        leader_projects_prometheus_active: 0.31,
        instance_projects_prometheus_active: 0.30,

        leader_service_desk_issues: 15.8,
        instance_service_desk_issues: 15.1,

        non_existing_column: 'value'
      }
    }
  end

  def stub_response(body)
    stub_request(:post, 'https://version.gitlab.com/usage_data')
      .to_return(
        headers: { 'Content-Type' => 'application/json' },
        body: body.to_json
      )
  end
end

