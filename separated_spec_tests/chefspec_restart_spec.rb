require 'chefspec'

describe 'windows_service::restart' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
                          .converge(described_recipe)
  end

  it 'restarts a windows_service with an explicit action' 


  it 'restarts a windows_service with attributes' 


  it 'restarts a windows_service when specifying the identity attribute' 

end

