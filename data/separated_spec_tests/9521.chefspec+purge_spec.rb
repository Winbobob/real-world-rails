require 'chefspec'

describe 'gem_package::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'purges a gem_package with an explicit action' 


  it 'purges a gem_package with attributes' 


  it 'purges a gem_package when specifying the identity attribute' 

end

