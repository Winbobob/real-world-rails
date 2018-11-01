require 'chefspec'

describe 'systemd_unit::stop' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'stops a systemd_unit daemon with an explicit action' 

end

