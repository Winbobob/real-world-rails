require 'chefspec'

describe 'windows_service::disable' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'disables a windows_service with an explicit action' 


  it 'disables a windows_service with attributes' 


  it 'disables a windows_service when specifying the identity attribute' 

end

