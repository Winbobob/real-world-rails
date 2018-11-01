require 'chefspec'

describe 'ifconfig::disable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'disables a ifconfig with an explicit action' 


  it 'disables a ifconfig with attributes' 

end

