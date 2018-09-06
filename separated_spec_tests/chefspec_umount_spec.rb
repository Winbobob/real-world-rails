require 'chefspec'

describe 'mount::umount' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'umounts a mount with an explicit action' 


  it 'umounts a mount with attributes' 

end

