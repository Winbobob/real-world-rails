require 'chefspec'

describe 'cookbook_file::touch' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'touches a cookbook_file with an explicit action' 


  it 'touches a cookbook_file with attributes' 


  it 'touches a cookbook_file when specifying the identity attribute' 

end

