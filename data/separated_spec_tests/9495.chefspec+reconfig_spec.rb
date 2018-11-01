require 'chefspec'

describe 'apt_package::reconfig' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'reconfigs a apt_package with an explicit action' 


  it 'reconfigs a apt_package with attributes' 


  it 'reconfigs a apt_package when specifying the identity attribute' 

end

