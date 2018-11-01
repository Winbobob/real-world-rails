require 'chefspec'

describe 'reboot::request' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a request_reboot' 

end

