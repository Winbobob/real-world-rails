require 'chefspec'

describe 'package::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'purges a package with an explicit action' 


  it 'purges a package with attributes' 


  it 'purges a package when specifying the identity attribute' 


  it 'purges all packages when given an array of names' 

end

