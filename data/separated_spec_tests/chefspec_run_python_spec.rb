require 'chefspec'

describe 'script::run_python' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'runs a python script with the default action' 


  it 'runs a python script with an explicit action' 


  it 'runs a python script with attributes' 

end

