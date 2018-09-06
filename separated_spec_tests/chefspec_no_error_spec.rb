require 'chefspec'

describe 'expect_exception::no_error' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'does not raise an error' 

end

