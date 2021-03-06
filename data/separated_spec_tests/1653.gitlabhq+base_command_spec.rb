require 'spec_helper'

describe Gitlab::Kubernetes::Helm::BaseCommand do
  let(:application) { create(:clusters_applications_helm) }
  let(:rbac) { false }

  let(:test_class) do
    Class.new do
      include Gitlab::Kubernetes::Helm::BaseCommand

      def initialize(rbac)
        @rbac = rbac
      end

      def name
        "test-class-name"
      end

      def rbac?
        @rbac
      end

      def files
        {
          some: 'value'
        }
      end
    end
  end

  let(:base_command) do
    test_class.new(rbac)
  end

  subject { base_command }

  it_behaves_like 'helm commands' do
    let(:commands) { '' }
  end

  describe '#pod_resource' do
    subject { base_command.pod_resource }

    it 'should returns a kubeclient resoure with pod content for application' 


    context 'when rbac is true' do
      let(:rbac) { true }

      it 'also returns a kubeclient resource' 

    end
  end

  describe '#pod_name' do
    subject { base_command.pod_name }

    it { is_expected.to eq('install-test-class-name') }
  end
end

