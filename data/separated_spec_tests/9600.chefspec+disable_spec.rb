require 'chefspec'

describe 'service::disable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'disables a service with an explicit action' 


  it 'disables a service with attributes' 


  it 'disables a service when specifying the identity attribute' 

end

