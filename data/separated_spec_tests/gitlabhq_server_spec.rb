require 'spec_helper'

describe Gitaly::Server do
  describe '.all' do
    let(:storages) { Gitlab.config.repositories.storages }

    it 'includes all storages' 

  end

  subject { described_class.all.first }

  it { is_expected.to respond_to(:server_version) }
  it { is_expected.to respond_to(:git_binary_version) }
  it { is_expected.to respond_to(:up_to_date?) }
  it { is_expected.to respond_to(:address) }

  describe 'request memoization' do
    context 'when requesting multiple properties', :request_store do
      it 'uses memoization for the info request' 

    end
  end
end

