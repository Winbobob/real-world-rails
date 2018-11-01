require 'chefspec'

describe 'launchd::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'creates a launchd daemon with an explicit action' 


  it 'creates a launchd daemon with a default_action action' 

end

