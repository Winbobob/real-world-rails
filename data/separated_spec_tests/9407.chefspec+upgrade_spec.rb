require 'chefspec'

describe 'chef_gem::upgrade' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'upgrades a chef_gem with an explicit action' 


  it 'upgrades a chef_gem with attributes' 


  it 'upgrades a chef_gem when specifying the identity attribute' 

end

