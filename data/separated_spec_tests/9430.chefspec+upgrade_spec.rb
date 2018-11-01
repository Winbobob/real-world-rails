require 'chefspec'

describe 'openbsd_package::upgrade' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'openbsd', version: '6.2').converge(described_recipe) }

  it 'upgrades a openbsd_package with an explicit action' 


  it 'upgrades a openbsd_package with attributes' 


  it 'upgrades a openbsd_package when specifying the identity attribute' 

end

