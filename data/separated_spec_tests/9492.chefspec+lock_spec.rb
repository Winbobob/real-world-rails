require 'chefspec'

describe 'apt_package::lock' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'locks a apt_package with an explicit action' 


  it 'locks a apt_package with attributes' 


  it 'locks a apt_package when specifying the identity attribute' 

end

