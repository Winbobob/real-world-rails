require 'chefspec'

describe 'zypper_package::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'opensuse', version: '42.3').converge(described_recipe) }

  it 'installs a zypper_package with the default action' 


  it 'installs a zypper_package with an explicit action' 


  it 'installs a zypper_package with attributes' 


  it 'installs a zypper_package when specifying the identity attribute' 

end

