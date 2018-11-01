require 'chefspec'

describe 'subversion::checkout' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'checkouts a subversion with an explicit action' 


  it 'checkouts a subversion with attributes' 


  it 'checkouts a subversion when specifying the identity attribute' 

end

