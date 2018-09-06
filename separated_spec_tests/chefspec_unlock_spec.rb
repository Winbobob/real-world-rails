require 'chefspec'

describe 'zypper_package::unlock' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'opensuse', version: '42.1').converge(described_recipe) }

  it 'unlocks a zypper_package with an explicit action' 


  it 'unlocks a zypper_package with attributes' 


  it 'unlocks a zypper_package when specifying the identity attribute' 

end

