require 'chefspec'

describe 'reboot::now' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a reboot_now when specifying action' 

end

