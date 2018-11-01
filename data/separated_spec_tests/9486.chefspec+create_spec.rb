require 'chefspec'

describe 'directory::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a directory with the default action' 


  it 'creates a directory with an explicit action' 


  it 'creates a directory with attributes' 


  it 'creates a directory with windows rights' 


  it 'creates a directory when specifying the identity attribute' 

end

