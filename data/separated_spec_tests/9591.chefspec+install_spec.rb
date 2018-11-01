require 'chefspec'

describe 'portage_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'gentoo', version: '4.9.95-gentoo')
                          .converge(described_recipe)
  end

  it 'installs a portage_package with the default action' 


  it 'installs a portage_package with an explicit action' 


  it 'installs a portage_package with attributes' 


  it 'installs a portage_package when specifying the identity attribute' 

end

