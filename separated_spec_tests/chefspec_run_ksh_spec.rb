require 'chefspec'

describe 'script::run_ksh' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'runs a ksh script with the default action' 


  it 'runs a ksh script with an explicit action' 


  it 'runs a ksh script with attributes' 

end

