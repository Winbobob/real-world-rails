require 'chefspec'

describe 'osx_profile::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.13').converge(described_recipe) }

  it 'removes an osx_profile from the resource name' 


  it 'removes an osx_profile from the profile property' 

end

