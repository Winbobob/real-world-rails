require 'chefspec'

describe 'launchd::disable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'disables a launchd daemon with an explicit action' 

end

