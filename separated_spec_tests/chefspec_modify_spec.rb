require 'chefspec'

describe 'group::modify' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'modifies a group with an explicit action' 


  it 'modifies a group with attributes' 


  it 'modifies a group when specifying the identity attribute' 

end

