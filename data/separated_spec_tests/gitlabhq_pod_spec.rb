require 'rails_helper'

describe Gitlab::Kubernetes::Helm::Pod do
  describe '#generate' do
    let(:cluster) { create(:cluster) }
    let(:app) {  create(:clusters_applications_prometheus, cluster: cluster) }
    let(:command) {  app.install_command }
    let(:namespace) { Gitlab::Kubernetes::Helm::NAMESPACE }

    subject { described_class.new(command, namespace) }

    shared_examples 'helm pod' do
      it 'should generate a Kubeclient::Resource' 


      it 'should generate the appropriate metadata' 


      it 'should generate a container spec' 


      it 'should generate the appropriate specifications for the container' 


      it 'should include a never restart policy' 

    end

    context 'with a install command' do
      it_behaves_like 'helm pod'

      it 'should include volumes for the container' 


      it 'should include a volume inside the specification' 


      it 'should mount configMap specification in the volume' 

    end

    context 'with a init command' do
      let(:app) { create(:clusters_applications_helm, cluster: cluster) }

      it_behaves_like 'helm pod'

      it 'should not include volumeMounts inside the container' 


      it 'should not a volume inside the specification' 

    end
  end
end

