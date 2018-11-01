require 'chefspec'

describe 'zypper_package::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'opensuse', version: '42.3').converge(described_recipe) }

  it 'removes a zypper_package with an explicit action' 


  it 'removes a zypper_package with attributes' 


  it 'removes a zypper_package when specifying the identity attribute' 

end

