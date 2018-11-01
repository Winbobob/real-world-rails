require 'chefspec'

describe 'zypper_package::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'opensuse', version: '42.3').converge(described_recipe) }

  it 'purges a zypper_package with an explicit action' 


  it 'purges a zypper_package with attributes' 


  it 'purges a zypper_package when specifying the identity attribute' 

end

