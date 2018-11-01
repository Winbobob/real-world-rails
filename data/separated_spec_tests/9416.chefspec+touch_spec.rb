require 'chefspec'

describe 'file::touch' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'touches a file with an explicit action' 


  it 'touches a file with attributes' 


  it 'touches a file when specifying the identity attribute' 

end

