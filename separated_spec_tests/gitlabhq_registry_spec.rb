require 'spec_helper'

describe Gitlab::Ci::Build::Credentials::Registry do
  let(:build) { create(:ci_build, name: 'spinach', stage: 'test', stage_idx: 0) }
  let(:registry_url) { 'registry.example.com:5005' }

  subject { described_class.new(build) }

  before do
    stub_container_registry_config(host_port: registry_url)
  end

  it 'contains valid DockerRegistry credentials' 


  describe '.valid?' do
    subject { described_class.new(build).valid? }

    context 'when registry is enabled' do
      before do
        stub_container_registry_config(enabled: true)
      end

      it { is_expected.to be_truthy }
    end

    context 'when registry is disabled' do
      before do
        stub_container_registry_config(enabled: false)
      end

      it { is_expected.to be_falsey }
    end
  end
end
