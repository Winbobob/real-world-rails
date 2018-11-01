require 'chefspec'

describe 'paludis_package::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'gentoo', version: '4.9.95-gentoo').converge(described_recipe) }

  it 'installs a paludis_package with the default action' 


  it 'installs a paludis_package with an explicit action' 


  it 'installs a paludis_package with attributes' 


  it 'installs a paludis_package when specifying the identity attribute' 

end

