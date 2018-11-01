require 'chefspec'

describe 'notifications::chained' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }
  let(:template) { chef_run.template('template') }
  let(:service)  { chef_run.service('service') }

  it 'sends a notification to the first service' 


  it 'sends a notification to the second service through the first' 


  it 'sends the specific notification to the serivce' 

end

