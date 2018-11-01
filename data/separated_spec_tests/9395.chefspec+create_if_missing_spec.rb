require 'chefspec'

describe 'cookbook_file::create_if_missing' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a cookbook_file with an explicit action' 


  it 'creates a cookbook_file with attributes' 


  it 'creates a cookbook_file when specifying the identity attribute' 

end

