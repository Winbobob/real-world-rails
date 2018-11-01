require 'chefspec'

describe 'openbsd_package::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'openbsd', version: '6.2').converge(described_recipe) }

  it 'purges a openbsd_package with an explicit action' 


  it 'purges a openbsd_package with attributes' 


  it 'purges a openbsd_package when specifying the identity attribute' 

end

