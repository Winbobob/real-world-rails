require 'chefspec'

describe 'script::run_csh' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a csh script with the default action' 


  it 'runs a csh script with an explicit action' 


  it 'runs a csh script with attributes' 

end

