require 'chefspec'

describe 'subscribes::before' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }
  let(:service) { chef_run.service('receiving_resource') }

  it 'subscribes to the template creation' 


  it 'subscribes to the specific action on the resource before' 

end

