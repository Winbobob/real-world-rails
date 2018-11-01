require 'chefspec'

describe 'bff_package::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'aix', version: '7.1').converge(described_recipe) }

  it 'installs a bff_package with the default action' 


  it 'installs a bff_package with an explicit action' 


  it 'installs a bff_package with attributes' 


  it 'installs a bff_package when specifying the identity attribute' 

end

