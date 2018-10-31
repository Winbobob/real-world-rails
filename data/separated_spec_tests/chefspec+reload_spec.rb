require 'chefspec'

describe 'service::reload' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'reloads a service with an explicit action' 


  it 'reloads a service with attributes' 


  it 'reloads a service when specifying the identity attribute' 

end

