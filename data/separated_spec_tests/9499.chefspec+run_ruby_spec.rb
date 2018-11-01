require 'chefspec'

describe 'script::run_ruby' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a ruby script with the default action' 


  it 'runs a ruby script with an explicit action' 


  it 'runs a ruby script with attributes' 

end

