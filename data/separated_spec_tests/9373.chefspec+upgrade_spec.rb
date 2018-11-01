require 'chefspec'

describe 'smartos_package::upgrade' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'smartos', version: '5.11')
                          .converge(described_recipe)
  end

  it 'upgrades a smartos_package with an explicit action' 


  it 'upgrades a smartos_package with attributes' 


  it 'upgrades a smartos_package when specifying the identity attribute' 

end

