require 'chefspec'

describe 'ifconfig::add' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'adds a ifconfig with the default action' 


  it 'adds a ifconfig with an explicit action' 


  it 'adds a ifconfig with attributes' 

end

