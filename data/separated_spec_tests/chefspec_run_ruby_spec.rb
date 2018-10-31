require 'chefspec'

describe 'script::run_ruby' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'runs a ruby script with the default action' 


  it 'runs a ruby script with an explicit action' 


  it 'runs a ruby script with attributes' 

end

