require 'chefspec'

describe 'template::touch' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'touches a template with an explicit action' 


  it 'touches a template with attributes' 


  it 'touches a template when specifying the identity attribute' 

end

