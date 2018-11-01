require 'chefspec'

describe 'systemd_unit::create' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'creates a systemd unit with an explicit action' 

end

