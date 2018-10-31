require 'chefspec'

describe 'systemd_unit::reload_or_try_restart' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'reloads or tries to restart a systemd_unit daemon with an explicit action' 

end

