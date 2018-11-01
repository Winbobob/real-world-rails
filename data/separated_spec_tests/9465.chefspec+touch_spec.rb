require 'chefspec'

describe 'remote_file::touch' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'touchs a remote_file with an explicit action' 


  it 'touchs a remote_file with attributes' 


  it 'touchs a remote_file when specifying the identity attribute' 

end

