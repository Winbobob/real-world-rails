require 'chefspec'

describe 'git::export' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'exports a git with an explicit action' 


  it 'exports a git with attributes' 


  it 'exports a git when specifying the identity attribute' 

end

