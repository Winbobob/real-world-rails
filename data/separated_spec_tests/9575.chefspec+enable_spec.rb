require 'chefspec'

describe 'launchd::enable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'enables a launchd daemon with an explicit action' 

end

