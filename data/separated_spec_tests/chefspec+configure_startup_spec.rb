require 'chefspec'

describe 'windows_service::configure_startup' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'configures startup for a windows_service with an explicit action' 


  it 'configures startup for a windows_service with attributes' 


  it 'configures startup for a windows_service when specifying the identity attribute' 

end

