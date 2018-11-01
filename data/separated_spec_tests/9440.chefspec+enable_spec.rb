require 'chefspec'

describe 'ifconfig::enable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'enables a ifconfig with an explicit action' 


  it 'enables a ifconfig with attributes' 

end

