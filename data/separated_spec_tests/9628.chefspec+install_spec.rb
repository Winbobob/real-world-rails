require 'chefspec'

describe 'package::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'installs a package with the default action' 


  it 'installs a package with an explicit action' 


  it 'installs a package with attributes' 


  it 'installs a package when specifying the identity attribute' 


  it 'installs all packages when given an array of names' 

end

