require 'chefspec'

describe 'mount::remount' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'remounts a mount with an explicit action' 


  it 'remounts a mount with attributes' 

end

