require 'chefspec'

describe 'remote_directory::create_if_missing' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a remote_directory with an explicit action' 


  it 'creates a remote_directory with attributes' 


  it 'creates a remote_directory when specifying the identity attribute' 

end

