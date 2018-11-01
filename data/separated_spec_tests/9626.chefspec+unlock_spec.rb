require 'chefspec'

describe 'package::unlock' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'unlocks a package with an explicit action' 


  it 'unlocks a package with attributes' 


  it 'unlocks a package when specifying the identity attribute' 


  it 'unlocks all packages when given an array of names' 

end

