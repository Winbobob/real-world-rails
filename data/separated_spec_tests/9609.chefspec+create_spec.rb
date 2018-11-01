require 'chefspec'

describe 'mdadm::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a mdadm with the default action' 


  it 'creates a mdadm with an explicit action' 


  it 'creates a mdadm with attributes' 


  it 'creates a mdadm when specifying the identity attribute' 

end

