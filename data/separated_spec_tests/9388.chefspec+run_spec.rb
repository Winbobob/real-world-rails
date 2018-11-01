require 'chefspec'

describe 'ruby_block::run' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a ruby_block with the default action' 


  it 'runs a ruby_block with an explicit action' 


  it 'runs a ruby_block when specifying the identity attribute' 

end

