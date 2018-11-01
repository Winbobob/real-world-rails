require 'chefspec'

describe 'systemd_unit::delete' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'deletes a systemd_unit with an explicit action' 

end

