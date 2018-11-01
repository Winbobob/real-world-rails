require 'chefspec'

describe 'package::lock' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'locks a package with an explicit action' 


  it 'locks a package with attributes' 


  it 'locks a package when specifying the identity attribute' 


  it 'locks all packages when given an array of names' 

end

