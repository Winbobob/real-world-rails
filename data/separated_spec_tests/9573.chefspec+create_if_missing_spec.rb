require 'chefspec'

describe 'launchd::create_if_missing' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'creates a launchd daemon if missing with an explicit action' 

end

