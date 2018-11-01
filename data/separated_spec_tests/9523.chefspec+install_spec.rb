require 'chefspec'

describe 'osx_profile::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'installs an osx_profile with an explicit action' 


  it 'starts an osx_profile with an implicit_action action' 

end

