require 'chefspec'

describe 'gem_package::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'removes a gem_package with an explicit action' 


  it 'removes a gem_package with attributes' 


  it 'removes a gem_package when specifying the identity attribute' 

end

