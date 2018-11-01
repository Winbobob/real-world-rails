require 'chefspec'

describe 'systemd_unit::start' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'starts a systemd_unit daemon with an explicit action' 

end

