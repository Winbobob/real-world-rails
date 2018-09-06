require 'chefspec'

describe 'systemd_unit::mask' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'masks a systemd unit with an explicit action' 

end

