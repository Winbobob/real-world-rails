require 'chefspec'

describe 'apt_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'installs a apt_package with the default action' 


  it 'installs a apt_package with an explicit action' 


  it 'installs a apt_package with attributes' 


  it 'installs a apt_package when specifying the identity attribute' 

end

