require 'chefspec'

describe 'subscribes::chained' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }
  let(:service)  { chef_run.service('service') }
  let(:log)      { chef_run.log('log') }

  it 'subscribes to the template creation' 


  it 'subscribes to a subscription from the first' 


  it 'subscribes to the specific subscription' 

end

