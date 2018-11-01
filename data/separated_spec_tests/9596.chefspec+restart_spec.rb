require 'chefspec'

describe 'service::restart' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'restarts a service with an explicit action' 


  it 'restarts a service with attributes' 


  it 'restarts a service when specifying the identity attribute' 

end

