require 'chefspec'

describe 'group::manage' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'manages a group with an explicit action' 


  it 'manages a group with attributes' 


  it 'manages a group when specifying the identity attribute' 

end

