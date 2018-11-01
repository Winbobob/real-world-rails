require 'chefspec'

describe 'yum_repository::create' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804')
                          .converge(described_recipe)
  end

  it 'create a yum_repository with default action' 


  it 'creates a yum_repository with create action' 

end

