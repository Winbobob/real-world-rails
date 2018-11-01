require 'chefspec'

describe 'route::add' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'adds a route with the default action' 


  it 'adds a route with an explicit action' 


  it 'adds a route with attributes' 


  it 'adds a route when specifying the identity attribute' 

end

