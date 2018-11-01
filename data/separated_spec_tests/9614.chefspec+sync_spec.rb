require 'chefspec'

describe 'subversion::sync' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'syncs a subversion with the default action' 


  it 'syncs a subversion with an explicit action' 


  it 'syncs a subversion with attributes' 


  it 'syncs a subversion when specifying the identity attribute' 

end

