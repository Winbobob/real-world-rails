require 'chefspec'

describe 'package::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'removes a package with an explicit action' 


  it 'removes a package with attributes' 


  it 'removes a package when specifying the identity attribute' 


  it 'removes all packages when given an array of names' 

end

