require 'chefspec'

describe 'template::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a template with an explicit action' 


  it 'deletes a template with attributes' 


  it 'deletes a template when specifying the identity attribute' 

end

