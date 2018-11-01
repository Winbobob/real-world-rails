require 'chefspec'

describe 'subversion::export' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'exports a subversion with an explicit action' 


  it 'exports a subversion with attributes' 


  it 'exports a subversion when specifying the identity attribute' 

end

