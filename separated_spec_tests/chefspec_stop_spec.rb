require 'chefspec'

describe 'windows_service::stop' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
                          .converge(described_recipe)
  end

  it 'stops a windows_service with an explicit action' 


  it 'stops a windows_service with attributes' 


  it 'stops a windows_service when specifying the identity attribute' 

end

