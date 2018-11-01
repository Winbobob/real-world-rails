require 'chefspec'

describe 'chef_gem::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'purges a chef_gem with an explicit action' 


  it 'purges a chef_gem with attributes' 


  it 'purges a chef_gem when specifying the identity attribute' 

end

