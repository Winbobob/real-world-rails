require 'chefspec'

describe 'apt_repository::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'removes a apt_repository with default action' 

end

