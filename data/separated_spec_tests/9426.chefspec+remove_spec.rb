require 'chefspec'

describe 'group::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'removes a group with an explicit action' 


  it 'removes a group with attributes' 


  it 'removes a group when specifying the identity attribute' 

end

