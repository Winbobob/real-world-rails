require 'chefspec'

describe 'macports_package::upgrade' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'upgrades a macports_package with an explicit action' 


  it 'upgrades a macports_package with attributes' 


  it 'upgrades a macports_package when specifying the identity attribute' 

end

