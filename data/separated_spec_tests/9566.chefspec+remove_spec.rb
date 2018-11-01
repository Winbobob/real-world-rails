require 'chefspec'

describe 'bff_package::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'aix', version: '7.1').converge(described_recipe) }

  it 'removes a bff_package with an explicit action' 


  it 'removes a bff_package with attributes' 


  it 'removes a bff_package when specifying the identity attribute' 

end

