require 'chefspec'

describe 'script::run_perl' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a perl script with the default action' 


  it 'runs a perl script with an explicit action' 


  it 'runs a perl script with attributes' 

end

