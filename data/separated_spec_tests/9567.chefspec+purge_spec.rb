require 'chefspec'

describe 'bff_package::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'aix', version: '7.1').converge(described_recipe) }

  it 'purges a bff_package with an explicit action' 


  it 'purges a bff_package with attributes' 


  it 'purges a bff_package when specifying the identity attribute' 

end

