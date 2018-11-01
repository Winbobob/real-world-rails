require 'chefspec'

describe 'dpkg_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'installs a dpkg_package with the default action' 


  it 'installs a dpkg_package with an explicit action' 


  it 'installs a dpkg_package with attributes' 


  it 'installs a dpkg_package when specifying the identity attribute' 

end

