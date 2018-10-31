require 'chefspec'

describe 'mdadm::stop' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'stops a mdadm with an explicit action' 


  it 'stops a mdadm with attributes' 


  it 'stops a mdadm when specifying the identity attribute' 

end

