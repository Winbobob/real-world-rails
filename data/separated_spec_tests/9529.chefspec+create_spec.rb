require 'chefspec'

describe 'link::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a link with the default action' 


  it 'creates a link with an explicit action' 


  it 'creates a link with attributes' 


  it 'creates a link when specifying the identity attribute' 

end

