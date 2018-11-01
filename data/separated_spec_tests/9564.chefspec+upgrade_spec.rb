require 'chefspec'

describe 'bff_package::upgrade' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'aix', version: '7.1').converge(described_recipe) }

  it 'upgrades a bff_package with an explicit action' 


  it 'upgrades a bff_package with attributes' 


  it 'upgrades a bff_package when specifying the identity attribute' 

end

