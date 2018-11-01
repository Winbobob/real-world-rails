require 'chefspec'

describe 'remote_directory::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a remote_directory with an explicit action' 


  it 'deletes a remote_directory with attributes' 


  it 'deletes a remote_directory when specifying the identity attribute' 

end

