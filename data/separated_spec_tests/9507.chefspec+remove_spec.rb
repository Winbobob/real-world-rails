require 'chefspec'

describe 'homebrew_package::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'removes a homebrew_package with an explicit action' 


  it 'removes a homebrew_package with attributes' 


  it 'removes a homebrew_package when specifying the identity attribute' 

end

