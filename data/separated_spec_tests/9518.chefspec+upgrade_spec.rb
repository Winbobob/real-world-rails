require 'chefspec'

describe 'gem_package::upgrade' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'upgrades a gem_package with an explicit action' 


  it 'upgrades a gem_package with attributes' 


  it 'upgrades a gem_package when specifying the identity attribute' 

end

