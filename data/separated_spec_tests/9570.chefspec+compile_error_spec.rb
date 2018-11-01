require 'chefspec'

describe 'expect_exception::compile_error' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'raises an error' 

end

