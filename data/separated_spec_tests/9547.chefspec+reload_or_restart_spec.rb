require 'chefspec'

describe 'systemd_unit::reload_or_restart' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'reloads or restarts a systemd_unit daemon with an explicit action' 

end

