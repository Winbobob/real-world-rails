require 'chefspec'

describe 'script::run_script' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a script with the default action' 


  it 'runs a script with an explicit action' 


  it 'runs a script with attributes' 

end

