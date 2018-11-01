require 'chefspec'

describe 'macports_package::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'purges a macports_package with an explicit action' 


  it 'purges a macports_package with attributes' 


  it 'purges a macports_package when specifying the identity attribute' 

end

