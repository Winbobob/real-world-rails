require 'chefspec'

describe 'chef_gem::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'installs a chef_gem with the default action' 


  it 'installs a chef_gem with an explicit action' 


  it 'installs a chef_gem with attributes' 


  it 'installs a chef_gem when specifying the identity attribute' 

end

