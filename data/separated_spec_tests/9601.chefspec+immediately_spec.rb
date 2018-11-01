require 'chefspec'

describe 'subscribes::immediately' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }
  let(:service) { chef_run.service('receiving_resource') }

  it 'sends a notification to the service' 


  it 'sends the specific notification to the serivce immediately' 

end

