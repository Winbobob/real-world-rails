require 'chefspec'

describe 'smartos_package::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'smartos', version: '5.11')
                          .converge(described_recipe)
  end

  it 'removes a smartos_package with an explicit action' 


  it 'removes a smartos_package with attributes' 


  it 'removes a smartos_package when specifying the identity attribute' 

end

