# frozen_string_literal: true

require 'spec_helper'

describe Clusters::Gcp::Kubernetes::CreateServiceAccountService do
  include KubernetesHelpers

  let(:service) { described_class.new(kubeclient, rbac: rbac) }

  describe '#execute' do
    let(:rbac) { false }
    let(:api_url) { 'http://111.111.111.111' }
    let(:username) { 'admin' }
    let(:password) { 'xxx' }

    let(:kubeclient) do
      Gitlab::Kubernetes::KubeClient.new(
        api_url,
        auth_options: { username: username, password: password }
      )
    end

    subject { service.execute }

    context 'when params are correct' do
      before do
        stub_kubeclient_discover(api_url)
        stub_kubeclient_create_service_account(api_url)
        stub_kubeclient_create_secret(api_url)
      end

      shared_examples 'creates service account and token' do
        it 'creates a kubernetes service account' 


        it 'creates a kubernetes secret of type ServiceAccountToken' 

      end

      context 'abac enabled cluster' do
        it_behaves_like 'creates service account and token'
      end

      context 'rbac enabled cluster' do
        let(:rbac) { true }

        before do
          stub_kubeclient_create_cluster_role_binding(api_url)
        end

        it_behaves_like 'creates service account and token'

        it 'creates a kubernetes cluster role binding' 

      end
    end
  end
end

