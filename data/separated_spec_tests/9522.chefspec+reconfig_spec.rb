require 'chefspec'

describe 'gem_package::reconfig' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'reconfigs a gem_package with an explicit action' 


  it 'reconfigs a gem_package with attributes' 


  it 'reconfigs a gem_package when specifying the identity attribute' 

end

