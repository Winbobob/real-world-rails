require 'chefspec'

describe 'apt_package::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'removes a apt_package with an explicit action' 


  it 'removes a apt_package with attributes' 


  it 'removes a apt_package when specifying the identity attribute' 

end

