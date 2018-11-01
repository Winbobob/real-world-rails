require 'chefspec'

describe 'solaris_package::upgrade' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'solaris2', version: '5.11')
                          .converge(described_recipe)
  end

  it 'upgrades a solaris_package with an explicit action' 


  it 'upgrades a solaris_package with attributes' 


  it 'upgrades a solaris_package when specifying the identity attribute' 

end

