require 'chefspec'

describe 'chef_gem::reconfig' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'reconfigs a chef_gem with an explicit action' 


  it 'reconfigs a chef_gem with attributes' 


  it 'reconfigs a chef_gem when specifying the identity attribute' 

end

