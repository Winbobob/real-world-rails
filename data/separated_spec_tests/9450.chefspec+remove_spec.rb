require 'chefspec'

describe 'yum_package::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804')
                          .converge(described_recipe)
  end

  it 'removes a yum_package with an explicit action' 


  it 'removes a yum_package with attributes' 


  it 'removes a yum_package when specifying the identity attribute' 

end

