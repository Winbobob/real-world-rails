require 'chefspec'

describe 'route::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a route with an explicit action' 


  it 'deletes a route with attributes' 


  it 'deletes a route when specifying the identity attribute' 

end

