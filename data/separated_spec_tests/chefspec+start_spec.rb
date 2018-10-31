require 'chefspec'

describe 'service::start' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'starts a service with an explicit action' 


  it 'starts a service with attributes' 


  it 'starts a service when specifying the identity attribute' 

end

