require 'chefspec'

describe 'gem_package::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'installs a gem_package with the default action' 


  it 'installs a gem_package with an explicit action' 


  it 'installs a gem_package with attributes' 


  it 'installs a gem_package when specifying the identity attribute' 

end

