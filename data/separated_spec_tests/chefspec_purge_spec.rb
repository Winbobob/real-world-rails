require 'chefspec'

describe 'paludis_package::purge' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'gentoo', version: '4.9.6-gentoo-r1').converge(described_recipe) }

  it 'purges a paludis_package with an explicit action' 


  it 'purges a paludis_package with attributes' 


  it 'purges a paludis_package when specifying the identity attribute' 

end

