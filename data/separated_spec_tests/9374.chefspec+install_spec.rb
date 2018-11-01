require 'chefspec'

describe 'smartos_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'smartos', version: '5.11')
                          .converge(described_recipe)
  end

  it 'installs a smartos_package with the default action' 


  it 'installs a smartos_package with an explicit action' 


  it 'installs a smartos_package with attributes' 


  it 'installs a smartos_package when specifying the identity attribute' 

end
