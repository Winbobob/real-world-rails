require 'spec_helper'

describe Clusters::Applications::InstallService do
  describe '#execute' do
    let(:application) { create(:clusters_applications_helm, :scheduled) }
    let!(:install_command) { application.install_command }
    let(:service) { described_class.new(application) }
    let(:helm_client) { instance_double(Gitlab::Kubernetes::Helm::Api) }

    before do
      allow(service).to receive(:install_command).and_return(install_command)
      allow(service).to receive(:helm_api).and_return(helm_client)
    end

    context 'when there are no errors' do
      before do
        expect(helm_client).to receive(:install).with(install_command)
        allow(ClusterWaitForAppInstallationWorker).to receive(:perform_in).and_return(nil)
      end

      it 'make the application installing' 


      it 'schedule async installation status check' 

    end

    context 'when k8s cluster communication fails' do
      before do
        error = Kubeclient::HttpError.new(500, 'system failure', nil)
        expect(helm_client).to receive(:install).with(install_command).and_raise(error)
      end

      it 'make the application errored' 

    end

    context 'when application cannot be persisted' do
      let(:application) { build(:clusters_applications_helm, :scheduled) }

      it 'make the application errored' 

    end
  end
end

