require 'spec_helper'

describe Upgrader do
  let(:upgrader) { described_class.new }
  let(:current_version) { GitlabCi::VERSION }

  describe 'current_version_raw' do
    it { expect(upgrader.current_version_raw).to eq current_version }
  end

  describe 'latest_version?' do
    it 'should be true if newest version' 

  end

  describe 'latest_version_raw' do
    it 'should be latest version for GitlabCI 3' 


    it 'should get the latest version from tags' 

  end
end

