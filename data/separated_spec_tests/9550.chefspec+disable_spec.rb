require 'chefspec'

describe 'systemd_unit::disable' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'disables a systemd unit with an explicit action' 

end

