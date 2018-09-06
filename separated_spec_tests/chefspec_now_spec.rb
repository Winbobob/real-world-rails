require 'chefspec'

describe 'reboot::now' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'runs a reboot_now when specifying action' 

end

