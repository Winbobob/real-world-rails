require 'chefspec'

describe 'pacman_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'arch', version: '4.10.13-1-ARCH')
                          .converge(described_recipe)
  end

  it 'installs a pacman_package with the default action' 


  it 'installs a pacman_package with an explicit action' 


  it 'installs a pacman_package with attributes' 


  it 'installs a pacman_package when specifying the identity attribute' 

end

