require 'chefspec'

describe 'yum_repository::makecache' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.5.1804')
                          .converge(described_recipe)
  end

  it 'makes cache for a yum_repository' 

end

