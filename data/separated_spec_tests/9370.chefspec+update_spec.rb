require 'chefspec'

describe 'apt_update::update' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
  end

  it 'updates apt repo' 

end

