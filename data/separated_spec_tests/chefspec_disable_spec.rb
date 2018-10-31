require 'chefspec'

describe 'mount::disable' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'disables a mount with an explicit action' 


  it 'disables a mount with attributes' 

end

