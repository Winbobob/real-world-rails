require 'chefspec'

describe 'apt_repository::add' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
                          .converge(described_recipe)
  end

  it 'adds a apt_repository with default action' 


  it 'installs a apt_repository with an explicit action' 

end

