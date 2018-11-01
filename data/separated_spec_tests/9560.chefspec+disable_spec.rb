require 'chefspec'

describe 'mount::disable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'disables a mount with an explicit action' 


  it 'disables a mount with attributes' 

end

