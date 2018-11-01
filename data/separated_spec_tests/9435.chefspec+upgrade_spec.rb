require 'chefspec'

describe 'pacman_package::upgrade' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'arch', version: '4.10.13-1-ARCH')
                          .converge(described_recipe)
  end

  it 'upgrades a pacman_package with an explicit action' 


  it 'upgrades a pacman_package with attributes' 


  it 'upgrades a pacman_package when specifying the identity attribute' 

end

