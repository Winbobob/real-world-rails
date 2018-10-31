require 'chefspec'

describe 'notifications::delayed' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }
  let(:template) { chef_run.template('/tmp/notifying_resource') }

  it 'sends a notification to the service' 


  it 'sends the specific notification to the serivce delayed' 

end

