require 'chefspec'

describe 'cookbook_file::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a cookbook_file with an explicit action' 


  it 'deletes a cookbook_file with attributes' 


  it 'deletes a cookbook_file when specifying the identity attribute' 

end

