require 'chefspec'

describe 'zypper_package::upgrade' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'opensuse', version: '42.3').converge(described_recipe) }

  it 'upgrades a zypper_package with an explicit action' 


  it 'upgrades a zypper_package with attributes' 


  it 'upgrades a zypper_package when specifying the identity attribute' 

end

