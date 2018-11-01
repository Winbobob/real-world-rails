require 'chefspec'

describe 'paludis_package::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'gentoo', version: '4.9.95-gentoo').converge(described_recipe) }

  it 'removes a paludis_package with an explicit action' 


  it 'removes a paludis_package with attributes' 


  it 'removes a paludis_package when specifying the identity attribute' 

end

