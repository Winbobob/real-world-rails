require 'chefspec'

describe 'pacman_package::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'arch', version: '4.10.13-1-ARCH')
                          .converge(described_recipe)
  end

  it 'removes a pacman_package with an explicit action' 


  it 'removes a pacman_package with attributes' 


  it 'removes a pacman_package when specifying the identity attribute' 

end

