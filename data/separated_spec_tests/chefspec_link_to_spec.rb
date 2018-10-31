require 'chefspec'

describe 'link::link_to' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'creates a link to the specified target' 

end

