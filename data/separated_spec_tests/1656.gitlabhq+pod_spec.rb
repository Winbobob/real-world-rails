require 'rails_helper'

describe Gitlab::Kubernetes::Helm::Pod do
  describe '#generate' do
    let(:app) {  create(:clusters_applications_prometheus) }
    let(:command) {  app.install_command }
    let(:namespace) { Gitlab::Kubernetes::Helm::NAMESPACE }
    let(:service_account_name) { nil }

    subject { described_class.new(command, namespace, service_account_name: service_account_name) }

    context 'with a command' do
      it 'should generate a Kubeclient::Resource' 


      it 'should generate the appropriate metadata' 


      it 'should generate a container spec' 


      it 'should generate the appropriate specifications for the container' 


      it 'should include a never restart policy' 


      it 'should include volumes for the container' 


      it 'should include a volume inside the specification' 


      it 'should mount configMap specification in the volume' 


      it 'should have no serviceAccountName' 


      context 'with a service_account_name' do
        let(:service_account_name) { 'sa' }

        it 'should use the serviceAccountName provided' 

      end
    end
  end
end

