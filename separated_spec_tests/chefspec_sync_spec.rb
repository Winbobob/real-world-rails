require 'chefspec'

describe 'git::sync' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'syncs a git with the default action' 


  it 'syncs a git with an explicit action' 


  it 'syncs a git with attributes' 


  it 'syncs a git when specifying the identity attribute' 

end

