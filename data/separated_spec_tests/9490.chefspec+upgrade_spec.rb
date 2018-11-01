require 'chefspec'

describe 'apt_package::upgrade' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'upgrades a apt_package with an explicit action' 


  it 'upgrades a apt_package with attributes' 


  it 'upgrades a apt_package when specifying the identity attribute' 

end

