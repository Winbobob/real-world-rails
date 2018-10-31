require 'chefspec'

describe 'compile_time::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'matches without .at_compile_time' 


  it 'matches with .at_compile_time' 


  it 'does not match when the resource is not at compile time' 


  it 'matches without .at_converge_time' 


  it 'matches with .at_converge_time' 


  it 'does not match when the resource is not at converge time' 

end

