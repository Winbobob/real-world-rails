require 'chefspec'

describe 'ifconfig::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a ifconfig with an explicit action' 


  it 'deletes a ifconfig with attributes' 

end

