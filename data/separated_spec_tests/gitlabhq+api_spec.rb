require 'spec_helper'

describe Gitlab::Kubernetes::Helm::Api do
  let(:client) { double('kubernetes client') }
  let(:helm) { described_class.new(client) }
  let(:gitlab_namespace) { Gitlab::Kubernetes::Helm::NAMESPACE }
  let(:namespace) { Gitlab::Kubernetes::Namespace.new(gitlab_namespace, client) }
  let(:application_name) { 'app-name' }
  let(:rbac) { false }
  let(:files) { {} }

  let(:command) do
    Gitlab::Kubernetes::Helm::InstallCommand.new(
      name: application_name,
      chart: 'chart-name',
      rbac: rbac,
      files: files
    )
  end

  subject { helm }

  before do
    allow(Gitlab::Kubernetes::Namespace).to receive(:new).with(gitlab_namespace, client).and_return(namespace)
    allow(client).to receive(:create_config_map)
  end

  describe '#initialize' do
    it 'creates a namespace object' 

  end

  describe '#install' do
    before do
      allow(client).to receive(:create_pod).and_return(nil)
      allow(client).to receive(:create_config_map).and_return(nil)
      allow(client).to receive(:create_service_account).and_return(nil)
      allow(client).to receive(:create_cluster_role_binding).and_return(nil)
      allow(namespace).to receive(:ensure_exists!).once
    end

    it 'ensures the namespace exists before creating the POD' 


    context 'with a ConfigMap' do
      let(:resource) { Gitlab::Kubernetes::ConfigMap.new(application_name, files).generate }

      it 'creates a ConfigMap on kubeclient' 

    end

    context 'without a service account' do
      it 'does not create a service account on kubeclient' 

    end

    context 'with a service account' do
      let(:command) { Gitlab::Kubernetes::Helm::InitCommand.new(name: application_name, files: files, rbac: rbac) }

      context 'rbac-enabled cluster' do
        let(:rbac) { true }

        let(:service_account_resource) do
          Kubeclient::Resource.new(metadata: { name: 'tiller', namespace: 'gitlab-managed-apps' })
        end

        let(:cluster_role_binding_resource) do
          Kubeclient::Resource.new(
            metadata: { name: 'tiller-admin' },
            roleRef: { apiGroup: 'rbac.authorization.k8s.io', kind: 'ClusterRole', name: 'cluster-admin' },
            subjects: [{ kind: 'ServiceAccount', name: 'tiller', namespace: 'gitlab-managed-apps' }]
          )
        end

        context 'service account and cluster role binding does not exist' do
          before do
            expect(client).to receive('get_service_account').with('tiller', 'gitlab-managed-apps').and_raise(Kubeclient::HttpError.new(404, 'Not found', nil))
            expect(client).to receive('get_cluster_role_binding').with('tiller-admin').and_raise(Kubeclient::HttpError.new(404, 'Not found', nil))
          end

          it 'creates a service account, followed the cluster role binding on kubeclient' 

        end

        context 'service account already exists' do
          before do
            expect(client).to receive('get_service_account').with('tiller', 'gitlab-managed-apps').and_return(service_account_resource)
            expect(client).to receive('get_cluster_role_binding').with('tiller-admin').and_raise(Kubeclient::HttpError.new(404, 'Not found', nil))
          end

          it 'updates the service account, followed by creating the cluster role binding' 

        end

        context 'service account and cluster role binding already exists' do
          before do
            expect(client).to receive('get_service_account').with('tiller', 'gitlab-managed-apps').and_return(service_account_resource)
            expect(client).to receive('get_cluster_role_binding').with('tiller-admin').and_return(cluster_role_binding_resource)
          end

          it 'updates the service account, followed by creating the cluster role binding' 

        end

        context 'a non-404 error is thrown' do
          before do
            expect(client).to receive('get_service_account').with('tiller', 'gitlab-managed-apps').and_raise(Kubeclient::HttpError.new(401, 'Unauthorized', nil))
          end

          it 'raises an error' 

        end
      end

      context 'legacy abac cluster' do
        it 'does not create a service account on kubeclient' 

      end
    end
  end

  describe '#update' do
    let(:rbac) { false }

    let(:command) do
      Gitlab::Kubernetes::Helm::UpgradeCommand.new(
        application_name,
        chart: 'chart-name',
        files: files,
        rbac: rbac
      )
    end

    before do
      allow(namespace).to receive(:ensure_exists!).once

      allow(client).to receive(:update_config_map).and_return(nil)
      allow(client).to receive(:create_pod).and_return(nil)
    end

    it 'ensures the namespace exists before creating the pod' 


    it 'updates the config map on kubeclient when one exists' 

  end

  describe '#status' do
    let(:phase) { Gitlab::Kubernetes::Pod::RUNNING }
    let(:pod) { Kubeclient::Resource.new(status: { phase: phase }) } # partial representation

    it 'fetches POD phase from kubernetes cluster' 

  end

  describe '#log' do
    let(:log) { 'some output' }
    let(:response) { RestClient::Response.new(log) }

    it 'fetches POD phase from kubernetes cluster' 

  end

  describe '#delete_pod!' do
    it 'deletes the POD from kubernetes cluster' 

  end

  describe '#get_config_map' do
    before do
      allow(namespace).to receive(:ensure_exists!).once
      allow(client).to receive(:get_config_map).and_return(nil)
    end

    it 'ensures the namespace exists before retrieving the config map' 


    it 'gets the config map on kubeclient' 

  end
end

