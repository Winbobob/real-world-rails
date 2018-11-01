require 'chefspec'

describe 'rpm_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804')
                          .converge(described_recipe)
  end

  it 'installs a rpm_package with the default action' 


  it 'installs a rpm_package with an explicit action' 


  it 'installs a rpm_package with attributes' 


  it 'installs a rpm_package when specifying the identity attribute' 

end

