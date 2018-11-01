require 'chefspec'

describe 'chef_gem::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'removes a chef_gem with an explicit action' 


  it 'removes a chef_gem with attributes' 


  it 'removes a chef_gem when specifying the identity attribute' 

end

