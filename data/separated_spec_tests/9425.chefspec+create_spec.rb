require 'chefspec'

describe 'group::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a group with the default action' 


  it 'creates a group with an explicit action' 


  it 'creates a group with attributes' 


  it 'creates a group when specifying the identity attribute' 

end

