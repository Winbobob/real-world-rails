require 'chefspec'

describe 'cookbook_file::create' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'creates a cookbook_file with the default action' 


  it 'creates a cookbook_file with an explicit action' 


  it 'creates a cookbook_file with attributes' 


  it 'creates a cookbook_file when specifying the identity attribute' 

end
