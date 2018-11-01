require 'chefspec'

describe 'ips_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'solaris2', version: '5.11')
                          .converge(described_recipe)
  end

  it 'installs a ips_package with the default action' 


  it 'installs a ips_package with an explicit action' 


  it 'installs a ips_package with attributes' 


  it 'installs a ips_package when specifying the identity attribute' 

end

