require 'chefspec'

describe 'yum_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804')
                          .converge(described_recipe)
  end

  it 'installs a yum_package with the default action' 


  it 'installs a yum_package with an explicit action' 


  it 'installs a yum_package with attributes' 


  it 'installs a yum_package when specifying the identity attribute' 

end

