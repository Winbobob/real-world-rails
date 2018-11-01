require 'chefspec'

describe 'homebrew_package::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'installs a homebrew_package with the default action' 


  it 'installs a homebrew_package with an explicit action' 


  it 'installs a homebrew_package with attributes' 


  it 'installs a homebrew_package when specifying the identity attribute' 

end

