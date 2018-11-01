require 'spec_helper'

describe Gitaly::Server do
  let(:server) { described_class.new('default') }

  describe '.all' do
    let(:storages) { Gitlab.config.repositories.storages }

    it 'includes all storages' 

  end

  subject { described_class.all.first }

  it { is_expected.to respond_to(:server_version) }
  it { is_expected.to respond_to(:git_binary_version) }
  it { is_expected.to respond_to(:up_to_date?) }
  it { is_expected.to respond_to(:address) }

  describe 'readable?' do
    context 'when the storage is readable' do
      it 'returns true' 

    end

    context 'when the storage is not readable', :broken_storage do
      it 'returns false' 

    end
  end

  describe 'writeable?' do
    context 'when the storage is writeable' do
      it 'returns true' 

    end

    context 'when the storage is not writeable', :broken_storage do
      it 'returns false' 

    end
  end

  describe 'request memoization' do
    context 'when requesting multiple properties', :request_store do
      it 'uses memoization for the info request' 

    end
  end
end

