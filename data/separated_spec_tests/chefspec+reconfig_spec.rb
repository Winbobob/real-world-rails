require 'chefspec'

describe 'package::reconfig' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'reconfigs a package with an explicit action' 


  it 'reconfigs a package with attributes' 


  it 'reconfigs a package when specifying the identity attribute' 


  it 'reconfigs all packages when given an array of names' 

end

