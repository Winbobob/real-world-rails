require 'chefspec'

describe 'openbsd_package::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'openbsd', version: '6.2').converge(described_recipe) }

  it 'removes a openbsd_package with an explicit action' 


  it 'removes a openbsd_package with attributes' 


  it 'removes a openbsd_package when specifying the identity attribute' 

end

