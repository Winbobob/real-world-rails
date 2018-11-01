require 'chefspec'

describe 'service::stop' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'stops a service with an explicit action' 


  it 'stops a service with attributes' 


  it 'stops a service when specifying the identity attribute' 

end

