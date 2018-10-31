require 'chefspec'

describe 'expect_exception::no_error' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'does not raise an error' 

end

