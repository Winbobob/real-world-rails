require 'chefspec'

describe 'homebrew_package::upgrade' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'upgrades a homebrew_package with an explicit action' 


  it 'upgrades a homebrew_package with attributes' 


  it 'upgrades a homebrew_package when specifying the identity attribute' 

end

