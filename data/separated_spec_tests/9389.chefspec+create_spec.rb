require 'chefspec'

describe 'ruby_block::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a ruby_block with an explicit action' 


  it 'creates a ruby_block when specifying the identity attribute' 

end

