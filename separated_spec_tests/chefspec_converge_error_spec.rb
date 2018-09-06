require 'chefspec'

describe 'expect_exception::converge_error' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'raises an error' 

end

