require 'chefspec'

describe 'package::upgrade' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'upgrades a package with an explicit action' 


  it 'upgrades a package with attributes' 


  it 'upgrades a package when specifying the identity attribute' 


  it 'upgrades all packages when given an array of names' 

end

