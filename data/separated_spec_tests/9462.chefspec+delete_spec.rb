require 'chefspec'

describe 'remote_file::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a remote_file with an explicit action' 


  it 'deletes a remote_file with attributes' 


  it 'deletes a remote_file when specifying the identity attribute' 

end

