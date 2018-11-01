require 'chefspec'

describe 'systemd_unit::enable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'enables a systemd unit with an explicit action' 

end

