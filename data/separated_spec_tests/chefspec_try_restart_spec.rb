require 'chefspec'

describe 'systemd_unit::try_restart' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'tries to restart a systemd_unit daemon with an explicit action' 

end

