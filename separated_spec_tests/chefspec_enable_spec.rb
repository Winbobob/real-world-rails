require 'chefspec'

describe 'mount::enable' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'enables a mount with an explicit action' 


  it 'enables a mount with attributes' 

end

