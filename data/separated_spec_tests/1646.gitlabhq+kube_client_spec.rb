# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Kubernetes::KubeClient do
  include KubernetesHelpers

  let(:api_url) { 'https://kubernetes.example.com/prefix' }
  let(:kubeclient_options) { { auth_options: { bearer_token: 'xyz' } } }

  let(:client) { described_class.new(api_url, kubeclient_options) }

  before do
    stub_kubeclient_discover(api_url)
  end

  shared_examples 'a Kubeclient' do
    it 'is a Kubeclient::Client' 


    it 'has the kubeclient options' 

  end

  describe '#core_client' do
    subject { client.core_client }

    it_behaves_like 'a Kubeclient'

    it 'has the core API endpoint' 


    it 'has the api_version' 

  end

  describe '#rbac_client' do
    subject { client.rbac_client }

    it_behaves_like 'a Kubeclient'

    it 'has the RBAC API group endpoint' 


    it 'has the api_version' 

  end

  describe '#extensions_client' do
    subject { client.extensions_client }

    it_behaves_like 'a Kubeclient'

    it 'has the extensions API group endpoint' 


    it 'has the api_version' 

  end

  describe 'core API' do
    let(:core_client) { client.core_client }

    [
      :get_pods,
      :get_secrets,
      :get_config_map,
      :get_pod,
      :get_namespace,
      :get_secret,
      :get_service,
      :get_service_account,
      :delete_pod,
      :create_config_map,
      :create_namespace,
      :create_pod,
      :create_secret,
      :create_service_account,
      :update_config_map,
      :update_service_account
    ].each do |method|
      describe "##{method}" do
        it 'delegates to the core client' 


        it 'responds to the method' 

      end
    end
  end

  describe 'rbac API group' do
    let(:rbac_client) { client.rbac_client }

    [
      :create_cluster_role_binding,
      :get_cluster_role_binding,
      :update_cluster_role_binding
    ].each do |method|
      describe "##{method}" do
        it 'delegates to the rbac client' 


        it 'responds to the method' 

      end
    end
  end

  describe 'extensions API group' do
    let(:api_groups) { ['apis/extensions'] }
    let(:extensions_client) { client.extensions_client }

    describe '#get_deployments' do
      it 'delegates to the extensions client' 


      it 'responds to the method' 

    end
  end

  describe 'non-entity methods' do
    it 'does not proxy for non-entity methods' 


    it 'throws an error' 

  end

  describe '#get_pod_log' do
    let(:core_client) { client.core_client }

    it 'is delegated to the core client' 

  end

  describe '#watch_pod_log' do
    let(:core_client) { client.core_client }

    it 'is delegated to the core client' 

  end

  describe 'methods that do not exist on any client' do
    it 'throws an error' 


    it 'returns false for respond_to' 

  end
end

