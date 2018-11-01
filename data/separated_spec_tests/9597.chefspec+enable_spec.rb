require 'chefspec'

describe 'service::enable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'enables a service with an explicit action' 


  it 'enables a service with attributes' 


  it 'enables a service when specifying the identity attribute' 

end

