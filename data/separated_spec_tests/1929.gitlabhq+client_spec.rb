require 'spec_helper'

describe GoogleApi::CloudPlatform::Client do
  let(:token) { 'token' }
  let(:client) { described_class.new(token, nil) }
  let(:user_agent_options) { client.instance_eval { user_agent_header } }

  describe '.session_key_for_redirect_uri' do
    let(:state) { 'random_string' }

    subject { described_class.session_key_for_redirect_uri(state) }

    it 'creates a new session key' 

  end

  describe '.new_session_key_for_redirect_uri' do
    it 'generates a new session key' 

  end

  describe '#validate_token' do
    subject { client.validate_token(expires_at) }

    let(:expires_at) { 1.hour.since.utc.strftime('%s') }

    context 'when token is nil' do
      let(:token) { nil }

      it { is_expected.to be_falsy }
    end

    context 'when expires_at is nil' do
      let(:expires_at) { nil }

      it { is_expected.to be_falsy }
    end

    context 'when expires in 1 hour' do
      it { is_expected.to be_truthy }
    end

    context 'when expires in 10 minutes' do
      let(:expires_at) { 5.minutes.since.utc.strftime('%s') }

      it { is_expected.to be_falsy }
    end
  end

  describe '#projects_zones_clusters_get' do
    subject { client.projects_zones_clusters_get(spy, spy, spy) }
    let(:gke_cluster) { double }

    before do
      allow_any_instance_of(Google::Apis::ContainerV1::ContainerService)
        .to receive(:get_zone_cluster).with(any_args, options: user_agent_options)
        .and_return(gke_cluster)
    end

    it { is_expected.to eq(gke_cluster) }
  end

  describe '#projects_zones_clusters_create' do
    subject do
      client.projects_zones_clusters_create(
        project_id, zone, cluster_name, cluster_size, machine_type: machine_type, legacy_abac: legacy_abac)
    end

    let(:project_id) { 'project-123' }
    let(:zone) { 'us-central1-a' }
    let(:cluster_name) { 'test-cluster' }
    let(:cluster_size) { 1 }
    let(:machine_type) { 'n1-standard-2' }
    let(:legacy_abac) { true }
    let(:create_cluster_request_body) { double('Google::Apis::ContainerV1::CreateClusterRequest') }
    let(:operation) { double }

    before do
      allow_any_instance_of(Google::Apis::ContainerV1::ContainerService)
        .to receive(:create_cluster).with(any_args)
        .and_return(operation)
    end

    it 'sets corresponded parameters' 


    context 'create without legacy_abac' do
      let(:legacy_abac) { false }

      it 'sets corresponded parameters' 

    end
  end

  describe '#projects_zones_operations' do
    subject { client.projects_zones_operations(spy, spy, spy) }
    let(:operation) { double }

    before do
      allow_any_instance_of(Google::Apis::ContainerV1::ContainerService)
        .to receive(:get_zone_operation).with(any_args, options: user_agent_options)
        .and_return(operation)
    end

    it { is_expected.to eq(operation) }
  end

  describe '#parse_operation_id' do
    subject { client.parse_operation_id(self_link) }

    context 'when expected url' do
      let(:self_link) do
        'projects/gcp-project-12345/zones/us-central1-a/operations/ope-123'
      end

      it { is_expected.to eq('ope-123') }
    end

    context 'when unexpected url' do
      let(:self_link) { '???' }

      it { is_expected.to be_nil }
    end
  end

  describe '#user_agent_header' do
    subject { client.instance_eval { user_agent_header } }

    it 'returns a RequestOptions object' 


    it 'has the correct GitLab version in User-Agent header' 

  end
end

