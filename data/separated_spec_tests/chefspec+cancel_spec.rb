require 'chefspec'

describe 'reboot::cancel' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a cancel_reboot' 

end

