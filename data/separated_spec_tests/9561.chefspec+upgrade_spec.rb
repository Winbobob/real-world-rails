require 'chefspec'

describe 'rpm_package::upgrade' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804')
                          .converge(described_recipe)
  end

  it 'upgrades a rpm_package with an explicit action' 


  it 'upgrades a rpm_package with attributes' 


  it 'upgrades a rpm_package when specifying the identity attribute' 

end

