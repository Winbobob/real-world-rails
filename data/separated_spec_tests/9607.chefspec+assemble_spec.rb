require 'chefspec'

describe 'mdadm::assemble' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'assembles a mdadm with an explicit action' 


  it 'assembles a mdadm with attributes' 


  it 'assembles a mdadm when specifying the identity attribute' 

end

