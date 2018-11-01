require 'chefspec'

describe 'windows_service::enable' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'enables a windows_service with an explicit action' 


  it 'enables a windows_service with attributes' 


  it 'enables a windows_service when specifying the identity attribute' 

end

