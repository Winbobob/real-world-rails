require 'spec_helper'

describe Clusters::Applications::CheckInstallationProgressService do
  RESCHEDULE_PHASES = Gitlab::Kubernetes::Pod::PHASES - [Gitlab::Kubernetes::Pod::SUCCEEDED, Gitlab::Kubernetes::Pod::FAILED].freeze

  let(:application) { create(:clusters_applications_helm, :installing) }
  let(:service) { described_class.new(application) }
  let(:phase) { Gitlab::Kubernetes::Pod::UNKNOWN }
  let(:errors) { nil }

  shared_examples 'a terminated installation' do
    it 'removes the installation POD' 

  end

  shared_examples 'a not yet terminated installation' do |a_phase|
    let(:phase) { a_phase }

    context "when phase is #{a_phase}" do
      context 'when not timeouted' do
        it 'reschedule a new check' 

      end

      context 'when timeouted' do
        let(:application) { create(:clusters_applications_helm, :timeouted) }

        it_behaves_like 'a terminated installation'

        it 'make the application errored' 

      end
    end
  end

  before do
    expect(service).to receive(:installation_phase).once.and_return(phase)

    allow(service).to receive(:installation_errors).and_return(errors)
    allow(service).to receive(:remove_installation_pod).and_return(nil)
  end

  describe '#execute' do
    context 'when installation POD succeeded' do
      let(:phase) { Gitlab::Kubernetes::Pod::SUCCEEDED }

      it_behaves_like 'a terminated installation'

      it 'make the application installed' 

    end

    context 'when installation POD failed' do
      let(:phase) { Gitlab::Kubernetes::Pod::FAILED }
      let(:errors) { 'test installation failed' }

      it_behaves_like 'a terminated installation'

      it 'make the application errored' 

    end

    RESCHEDULE_PHASES.each { |phase| it_behaves_like 'a not yet terminated installation', phase }
  end
end

