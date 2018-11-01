require 'chefspec'

describe 'launchd::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'deletes a launchd with an explicit action' 

end

