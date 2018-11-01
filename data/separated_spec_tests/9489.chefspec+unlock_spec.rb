require 'chefspec'

describe 'apt_package::unlock' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'unlocks a apt_package with an explicit action' 


  it 'unlocks a apt_package with attributes' 


  it 'unlocks a apt_package when specifying the identity attribute' 

end

