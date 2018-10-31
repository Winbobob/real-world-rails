require 'chefspec'

describe 'apt_update::periodic' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'updates apt with default action' 


  it 'installs an apt_repository with an explicit action' 

end

