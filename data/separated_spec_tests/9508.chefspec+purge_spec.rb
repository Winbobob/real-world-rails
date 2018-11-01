require 'chefspec'

describe 'homebrew_package::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'purges a homebrew_package with an explicit action' 


  it 'purges a homebrew_package with attributes' 


  it 'purges a homebrew_package when specifying the identity attribute' 

end

