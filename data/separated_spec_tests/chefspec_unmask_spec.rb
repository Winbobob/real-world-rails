require 'chefspec'

describe 'systemd_unit::unmask' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'unmasks a systemd_unit daemon with an explicit action' 

end

