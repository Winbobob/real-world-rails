require 'chefspec'

describe 'windows_package::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2016')
                          .converge(described_recipe)
  end

  it 'removes a windows_package with an explicit action' 


  it 'removes a windows_package with attributes' 


  it 'removes a windows_package when specifying the identity attribute' 

end

