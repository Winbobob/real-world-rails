require 'chefspec'

describe 'portage_package::upgrade' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'gentoo', version: '4.9.95-gentoo')
                          .converge(described_recipe)
  end

  it 'upgrades a portage_package with an explicit action' 


  it 'upgrades a portage_package with attributes' 


  it 'upgrades a portage_package when specifying the identity attribute' 

end

