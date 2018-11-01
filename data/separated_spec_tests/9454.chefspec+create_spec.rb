require 'chefspec'

describe 'template::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a template with the default action' 


  it 'creates a template with an explicit action' 


  it 'creates a template with attributes' 


  it 'creates a template when specifying the identity attribute' 

end

