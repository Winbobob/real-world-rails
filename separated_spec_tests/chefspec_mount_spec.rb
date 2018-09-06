require 'chefspec'

describe 'mount::mount' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'mounts a mount with the default action' 


  it 'mounts a mount with an explicit action' 


  it 'mounts a mount with attributes' 

end

