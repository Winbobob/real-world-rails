require 'spec_helper'

describe Gitlab::Upgrader do
  let(:upgrader) { described_class.new }
  let(:current_version) { Gitlab::VERSION }

  describe 'current_version_raw' do
    it { expect(upgrader.current_version_raw).to eq(current_version) }
  end

  describe 'latest_version?' do
    it 'is true if newest version' 

  end

  describe 'latest_version_raw' do
    it 'is the latest version for GitLab 5' 


    it 'gets the latest version from tags' 

  end
end

