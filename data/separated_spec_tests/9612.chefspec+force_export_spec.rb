require 'chefspec'

describe 'subversion::force_export' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'force_exports a subversion with an explicit action' 


  it 'force_exports a subversion with attributes' 


  it 'force_exports a subversion when specifying the identity attribute' 

end

