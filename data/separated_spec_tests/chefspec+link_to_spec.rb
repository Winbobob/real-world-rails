require 'chefspec'

describe 'link::link_to' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a link to the specified target' 

end

