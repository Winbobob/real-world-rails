require 'chefspec'

describe 'yum_repository::makecache' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611')
                          .converge(described_recipe)
  end

  it 'makes cache for a yum_repository' 

end

