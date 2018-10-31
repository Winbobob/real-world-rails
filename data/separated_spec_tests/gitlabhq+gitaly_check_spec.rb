require 'spec_helper'

describe Gitlab::HealthChecks::GitalyCheck do
  let(:result_class) { Gitlab::HealthChecks::Result }
  let(:repository_storages) { ['default'] }

  before do
    allow(described_class).to receive(:repository_storages) { repository_storages }
  end

  describe '#readiness' do
    subject { described_class.readiness }

    before do
      expect(Gitlab::GitalyClient::HealthCheckService).to receive(:new).and_return(gitaly_check)
    end

    context 'Gitaly server is up' do
      let(:gitaly_check) { double(check: { success: true }) }

      it { is_expected.to eq([result_class.new(true, nil, shard: 'default')]) }
    end

    context 'Gitaly server is down' do
      let(:gitaly_check) { double(check: { success: false, message: 'Connection refused' }) }

      it { is_expected.to eq([result_class.new(false, 'Connection refused', shard: 'default')]) }
    end
  end

  describe '#metrics' do
    subject { described_class.metrics }
    let(:server) { double(storage: 'default', read_writeable?: up) }

    before do
      allow(Gitaly::Server).to receive(:new).and_return(server)
    end

    context 'Gitaly server is up' do
      let(:up) { true }

      it 'provides metrics' 

    end

    context 'Gitaly server is down' do
      let(:up) { false }

      it 'provides metrics' 

    end
  end
end

