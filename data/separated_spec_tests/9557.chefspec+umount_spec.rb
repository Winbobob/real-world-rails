require 'chefspec'

describe 'mount::umount' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'umounts a mount with an explicit action' 


  it 'umounts a mount with attributes' 

end

