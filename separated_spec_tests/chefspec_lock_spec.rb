require 'chefspec'

describe 'zypper_package::lock' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'opensuse', version: '42.1').converge(described_recipe) }

  it 'locks a zypper_package with an explicit action' 


  it 'locks a zypper_package with attributes' 


  it 'locks a zypper_package when specifying the identity attribute' 

end

