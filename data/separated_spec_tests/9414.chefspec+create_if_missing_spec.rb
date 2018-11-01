require 'chefspec'

describe 'file::create_if_missing' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a file with an explicit action' 


  it 'creates a file with attributes' 


  it 'creates a file when specifying the identity attribute' 

end
